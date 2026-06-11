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
      if (!mounted) return;
      context.read<StoriesProvider>().fetchDetailStory(widget.storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        title: Text(
          'Story Detail',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
        ),
      ),
      body: Consumer<StoriesProvider>(
        builder: (context, storiesProvider, _) {
          if (storiesProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (storiesProvider.isFailure) {
            return ErrorItem(
              title: 'Failed to load story',
              message: ErrorItem.friendlyMessage(storiesProvider.errorMessage),
              onRetry: () => storiesProvider.fetchDetailStory(widget.storyId),
            );
          }

          final story = storiesProvider.detailStoryModel?.detailStoryResult;
          if (story == null) {
            return const SizedBox.shrink();
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
