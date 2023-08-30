import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/widget/bottom_modal.dart';
import 'package:tiktok_clone/assignment/thread/widget/vertical_line.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ThreadItem extends StatelessWidget {
  final List<String> imageUrls;

  const ThreadItem({
    required this.imageUrls,
    super.key,
  });

  bool _isImage() {
    return imageUrls.isNotEmpty;
  }

  bool _isMultipleImage() {
    return imageUrls.length > 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Sizes.size16,
        right: _isMultipleImage() ? 0 : Sizes.size16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _makeTopRow(context),
          _makeMiddleRow(context),
          _makeBottomRow(context),
          const Divider(),
        ],
      ),
    );
  }

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
      builder: (context) => const Wrap(children: [
        BottomModal(),
      ]),
    );
  }

  Widget _makeTopRow(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(
            "https://cdn.digitaltoday.co.kr/news/photo/202307/482434_450263_3759.jpg",
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "pubity",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "2m",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(
                          width: Sizes.size10,
                        ),
                        GestureDetector(
                          onTap: () => _onShowModal(context),
                          child: const Icon(
                            Icons.more_horiz,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: Sizes.size4,
                ),
                const Text(
                  "Vine after seeing the Threads logo unveiled:",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeMiddleRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size18,
            vertical: Sizes.size10,
          ),
          child: CustomPaint(
            painter: const VerticalLine(),
            size: Size(
              2,
              _isImage() ? 240 : 40,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: Sizes.size16, top: Sizes.size16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isImage()
                    ? (_isMultipleImage()
                        ? SizedBox(
                            // width: double.infinity,
                            height: 220,
                            child: ListView.builder(
                              itemCount: imageUrls.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ImageItem(
                                imageUrl: imageUrls[index],
                                width: MediaQuery.of(context).size.width * 0.75,
                                isPadding: true,
                              ),
                            ),
                          )
                        : ImageItem(
                            imageUrl: imageUrls[0],
                            width: MediaQuery.of(context).size.width * 0.8,
                          ))
                    : const SizedBox.shrink(),
                SizedBox(
                  height: _isImage() ? Sizes.size16 : Sizes.size8,
                ),
                const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heart,
                      size: Sizes.size24,
                    ),
                    SizedBox(
                      width: Sizes.size20,
                    ),
                    FaIcon(
                      FontAwesomeIcons.message,
                      size: Sizes.size24,
                    ),
                    SizedBox(
                      width: Sizes.size20,
                    ),
                    FaIcon(
                      FontAwesomeIcons.arrowsRotate,
                      size: Sizes.size24,
                    ),
                    SizedBox(
                      width: Sizes.size20,
                    ),
                    FaIcon(
                      FontAwesomeIcons.paperPlane,
                      size: Sizes.size24,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeBottomRow(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(
            "https://cdn.womaneconomy.co.kr/news/photo/202307/218088_425579_3146.jpg",
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size16,
              top: Sizes.size16,
              bottom: Sizes.size16,
            ),
            child: Row(
              children: [
                Text(
                  "36 replies",
                  style: TextStyle(
                      fontSize: Sizes.size16, color: Colors.grey.shade600),
                ),
                Text(
                  "•",
                  style: TextStyle(
                      fontSize: Sizes.size16, color: Colors.grey.shade600),
                ),
                Text(
                  "391 likes",
                  style: TextStyle(
                      fontSize: Sizes.size16, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final double width;
  final bool isPadding;

  const ImageItem({
    required this.imageUrl,
    required this.width,
    this.isPadding = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: isPadding ? Sizes.size16 : 0,
      ),
      child: Container(
        width: width,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(Sizes.size20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.size20),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
