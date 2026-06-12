part of 'views.dart';

class StoriesView extends StatefulWidget {
  static const appRoute = "/stories";
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<StoriesProvider>().fetchStoriesList().then((_) {
        _loadMoreIfNeeded();
      });
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  void _loadMore() {
    final storiesProvider = context.read<StoriesProvider>();
    storiesProvider.fetchMoreStories().then((_) {
      _loadMoreIfNeeded();
    });
  }

  void _loadMoreIfNeeded() {
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;

      final storiesProvider = context.read<StoriesProvider>();
      final position = _scrollController.position;

      if (storiesProvider.hasMore &&
          !storiesProvider.isLoadingMore &&
          !storiesProvider.isInitialLoading &&
          position.maxScrollExtent <= 0) {
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          l10n.stories,
          style: whiteTextStyle.copyWith(fontSize: 22, fontWeight: bold),
        ),
        shadowColor: greyColor,
        actions: [
          PopupMenuButton<Locale>(
            tooltip: l10n.changeLanguage,
            icon: Icon(Icons.language, color: whiteColor),
            onSelected: (locale) {
              context.read<LocaleProvider>().setLocale(locale);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: const Locale('en'),
                child: Text(l10n.english),
              ),
              PopupMenuItem(
                value: const Locale('id'),
                child: Text(l10n.indonesian),
              ),
            ],
          ),
          IconButton(
            tooltip: l10n.logout,
            onPressed: () => context.read<AuthProvider>().logout(),
            icon: Icon(Icons.logout, color: whiteColor),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        onPressed: () async {
          final message = await context.push<String>(AddStoryView.appRoute);
          if (!mounted) return;
          if (message != null && message.isNotEmpty) {
            showSnackBar(context, message, backgroundColor: greenColor);
          }
        },
        label: Row(children: [Icon(Icons.add), Text(l10n.addStory)]),
      ),
      body: Consumer<StoriesProvider>(
        builder: (context, storiesProvider, _) {
          final stories = storiesProvider.stories;

          if (storiesProvider.isInitialLoading && stories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (storiesProvider.isFailure && stories.isEmpty) {
            return ErrorItem(
              title: l10n.failedToLoadStories,
              message: ErrorItem.friendlyMessage(
                context,
                storiesProvider.errorMessage,
              ),
              onRetry: () => storiesProvider.fetchStoriesList(),
            );
          }

          if (stories.isEmpty) {
            return Center(
              child: Text(
                l10n.noStoriesYet,
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            );
          }

          return RefreshIndicator(
            backgroundColor: primaryColor,
            color: whiteColor,
            onRefresh: () async {
              await storiesProvider.fetchStoriesList();
              _loadMoreIfNeeded();
            },
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.hiWelcome,
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          context.read<AuthProvider>().currentUser?.email ?? '',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= stories.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final story = stories[index];
                      return GestureDetector(
                        onTap: () => context.push('/detailStory/${story.id}'),
                        child: StoryListItem(storyItemResult: story),
                      );
                    },
                    childCount:
                        stories.length +
                        (storiesProvider.isLoadingMore ? 1 : 0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
