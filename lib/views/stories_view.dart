part of 'views.dart';

class StoriesView extends StatefulWidget {
  static const appRoute = "/stories";
  const StoriesView({super.key});

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<StoriesProvider>().fetchStoriesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Stories",
          style: whiteTextStyle.copyWith(fontSize: 22, fontWeight: bold),
        ),
        shadowColor: greyColor,
        actions: [
          IconButton(
            tooltip: 'Logout',
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
        label: Row(children: [Icon(Icons.add), Text("Tambah Story")]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Welcome!",
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
          Expanded(
            child: Consumer<StoriesProvider>(
              builder: (context, storiesProvider, _) {
                final stories = storiesProvider.storiesModel?.listStory ?? [];
                if (storiesProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (storiesProvider.isFailure) {
                  return ErrorItem(
                    title: 'Failed to load stories',
                    message: ErrorItem.friendlyMessage(
                      storiesProvider.errorMessage,
                    ),
                    onRetry: () => storiesProvider.fetchStoriesList(),
                  );
                }
                if (stories.isEmpty) {
                  return Center(
                    child: Text(
                      'No stories yet',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  );
                }

                return RefreshIndicator(
                  backgroundColor: primaryColor,
                  color: whiteColor,
                  onRefresh: () => storiesProvider.fetchStoriesList(),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return GestureDetector(
                        onTap: () => context.push('/detailStory/${story.id}'),
                        child: StoryListItem(storyItemResult: story),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
