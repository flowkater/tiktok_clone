import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityListTile extends StatelessWidget {
  final String name;
  final String time;
  final String message;
  final String? subMessage;
  final String image;
  final bool isFollowing;

  const ActivityListTile({
    required this.name,
    required this.time,
    required this.message,
    this.subMessage,
    required this.image,
    required this.isFollowing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: Sizes.size4),
              Text(
                time,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.size4,
          ),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: Sizes.size16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(
            height: Sizes.size4,
          ),
        ],
      ),
      subtitle: subMessage != null
          ? Text(
              subMessage!,
              style: const TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black,
              ),
            )
          : null,
      leading: CircleAvatar(
        radius: Sizes.size24,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: NetworkImage(
          image,
        ),
      ),
      trailing: isFollowing
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size12),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size12,
                horizontal: Sizes.size16,
              ),
              child: Text(
                "Following",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
              ),
            )
          : null,
    );
  }
}

class SearchListTile extends StatelessWidget {
  final String name;
  final String message;
  final String? subMessage;
  final String image;

  const SearchListTile({
    required this.name,
    required this.message,
    this.subMessage,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: Sizes.size4),
                const Icon(
                  color: Colors.blue,
                  Icons.verified,
                  size: Sizes.size16,
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.size4,
            ),
            Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: Sizes.size4,
            ),
          ],
        ),
        subtitle: subMessage != null
            ? Text(
                subMessage!,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black,
                ),
              )
            : null,
        leading: CircleAvatar(
          radius: Sizes.size24,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size12),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size6,
            horizontal: Sizes.size20,
          ),
          child: const Text(
            "Follow",
            style: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ));
  }
}
