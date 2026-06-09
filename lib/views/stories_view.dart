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
      context.read<StoriesProvider>().fetchStoriesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Stories",
          style: blackTextStyle.copyWith(fontSize: 22, fontWeight: bold),
        ),
        shadowColor: greyColor,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () => context.read<AuthProvider>().logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AddStoryView.appRoute),
        child: const Icon(Icons.add),
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
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            storiesProvider.errorMessage ??
                                'Failed to load List :(',
                            textAlign: TextAlign.center,
                            style: greyTextStyle,
                          ),
                          const SizedBox(height: 16),
                          CustomFilledButton(
                            title: 'Retry',
                            width: 160,
                            onPressed: () => storiesProvider.fetchStoriesList(),
                          ),
                        ],
                      ),
                    ),
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
                  onRefresh: () => storiesProvider.fetchStoriesList(),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return GestureDetector(
                        onTap: () => context.push(DetailStoriesView.appRoute),
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
