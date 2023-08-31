import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostModal extends StatelessWidget {
  const PostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Thread'),
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: Sizes.size20, left: Sizes.size20),
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: Sizes.size16),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: Sizes.size10,
                            right: Sizes.size10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                radius: 20.0,
                                backgroundImage: NetworkImage(
                                  "https://i.namu.wiki/i/CbBhVxmAkXCEVC0zzELg7J66aVyrjTG-dVasMl1snoH95PPTOgCHZPaA9HtgQ_d8L2cW3eho8nwGM9_seUcHlA.webp",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size10,
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 50,
                                  ),
                                  child: Expanded(
                                    child: Container(
                                      width: 2,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                              ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.lighten,
                                ),
                                child: CircleAvatar(
                                  foregroundColor: Colors.grey.shade800,
                                  radius: 10.0,
                                  backgroundImage: const NetworkImage(
                                    "https://i.namu.wiki/i/CbBhVxmAkXCEVC0zzELg7J66aVyrjTG-dVasMl1snoH95PPTOgCHZPaA9HtgQ_d8L2cW3eho8nwGM9_seUcHlA.webp",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size4,
                            vertical: Sizes.size10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Tony",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                constraints: const BoxConstraints(
                                  minHeight: 30,
                                ),
                                child: const Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null, //
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText: 'Start a thread...',
                                      contentPadding: EdgeInsets.only(
                                        top: Sizes.size5,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: Sizes.size10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("Add File");
                                },
                                child: Transform.rotate(
                                  angle: 0.8,
                                  child: Icon(
                                    Icons.attach_file,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Anyone can reply",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Text(
                    "Post",
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// grey bar
// Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: Sizes.size40,
//                 height: Sizes.size4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(Sizes.size2),
//                 ),
//               ),
//             ],
//           ),
