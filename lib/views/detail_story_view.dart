part of 'views.dart';

class DetailStoriesView extends StatefulWidget {
  static const appRoute = '/detailStory/:id';
  final String storyId;

  const DetailStoriesView({super.key, required this.storyId});

  @override
  State<DetailStoriesView> createState() => _DetailStoriesViewState();
}

class _DetailStoriesViewState extends State<DetailStoriesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StoriesProvider>().fetchDetailStory(widget.storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Story Detail',
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
      ),
      body: Consumer<StoriesProvider>(
        builder: (context, storiesProvider, _) {
          final story = storiesProvider.detailStoryModel?.detailStoryResult;
          if (story == null) {
            return const SizedBox.shrink();
          }
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
                      storiesProvider.errorMessage ?? 'Failed to load story',
                      textAlign: TextAlign.center,
                      style: greyTextStyle,
                    ),
                    const SizedBox(height: 16),
                    CustomFilledButton(
                      title: 'Retry',
                      width: 160,
                      onPressed: () =>
                          storiesProvider.fetchDetailStory(widget.storyId),
                    ),
                  ],
                ),
              ),
            );
          }
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  story.photoUrl,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        story.createdAt.toLocal().toString().split(' ')[0],
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        story.description,
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
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
