import 'package:ceritakita/models/stories_model.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:flutter/material.dart';

class StoryListItem extends StatelessWidget {
  final StoryResult storyItemResult;
  const StoryListItem({super.key, required this.storyItemResult});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            storyItemResult.photoUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storyItemResult.name,
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  storyItemResult.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  storyItemResult.createdAt.toLocal().toString().split(' ')[0],
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
