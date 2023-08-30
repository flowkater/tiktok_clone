import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({super.key});

  void _onShowModal(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => const BottomReportModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Sizes.size14, bottom: Sizes.size28),
      child: Column(
        children: [
          CupertinoListSection.insetGrouped(
            dividerMargin: -10,
            hasLeading: false,
            backgroundColor: Colors.white,
            children: <CupertinoListTile>[
              CupertinoListTile.notched(
                backgroundColor: Colors.grey.shade100,
                title: const Text(
                  'Unfollow',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // trailing: const CupertinoListTileChevron(),
                onTap: () {
                  print("Unfollow");
                },
              ),
              CupertinoListTile.notched(
                backgroundColor: Colors.grey.shade100,
                title: const Text(
                  'Mute',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // trailing: const CupertinoListTileChevron(),
                onTap: () {
                  print("Mute");
                },
              ),
            ],
          ),
          CupertinoListSection.insetGrouped(
            dividerMargin: -10,
            hasLeading: false,
            backgroundColor: Colors.white,
            children: <CupertinoListTile>[
              CupertinoListTile.notched(
                backgroundColor: Colors.grey.shade100,
                title: const Text(
                  'Hide',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // trailing: const CupertinoListTileChevron(),
                onTap: () {
                  print("Hide");
                },
              ),
              CupertinoListTile.notched(
                backgroundColor: Colors.grey.shade100,
                title: const Text(
                  'Report',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                // trailing: const CupertinoListTileChevron(),
                onTap: () => _onShowModal(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<String> items = [
  "i just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
  "i just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
];

class BottomReportModal extends StatelessWidget {
  const BottomReportModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Sizes.size20, bottom: Sizes.size28),
      child: Column(children: [
        const Text(
          'Report',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        const SizedBox(
          height: Sizes.size10,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size18,
            vertical: Sizes.size14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Why are you reporting this thread?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size18,
                ),
              ),
              Text(
                "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      items[index],
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      size: Sizes.size20,
                    ),
                    onTap: () {
                      print("items[index] $index");
                    },
                  )),
        )
      ]),
    );
  }
}
