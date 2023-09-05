class ActivityModel {
  final String name;
  final String time;
  final String message;
  String? subMessage;
  String image;
  final bool isFollowing;

  ActivityModel({
    required this.name,
    required this.time,
    required this.message,
    this.subMessage,
    required this.image,
    this.isFollowing = false,
  });

  void changeImage(int id) {
    image = generateImageUrl(id);
  }

  int getImageNumber() {
    final split = image.split("/");
    final id = split[split.length - 3];
    return int.parse(id);
  }
}

String generateImageUrl(int id) {
  return "https://picsum.photos/id/$id/200/300";
}

final List<ActivityModel> activitiesList = [
  ActivityModel(
    name: "tony",
    time: "4h",
    message: "Mentioned you",
    subMessage:
        "Here's a thread you shouyld follow if you love botany @jane_mobbins",
    image: generateImageUrl(110),
  ),
  ActivityModel(
    name: "tony",
    time: "4h",
    message: "Starting out my gardening club with thr..",
    subMessage: "Count me in!",
    image: generateImageUrl(110),
  ),
  ActivityModel(
    name: "kater",
    time: "5h",
    message: "Followed you",
    isFollowing: true,
    image: generateImageUrl(142),
  ),
  ActivityModel(
    name: "kater",
    time: "5h",
    message: "Wow! 😀😇🥺",
    image: generateImageUrl(142),
  ),
  ActivityModel(
    name: "Paul",
    time: "5h",
    message: "😀😇🥺",
    image: generateImageUrl(132),
  ),
];

List<ActivityModel> generateActivityList(int id) {
  return activitiesList.map((e) {
    // e.changeImage(e.getImageNumber() + id);
    return e;
  }).toList();
}

final List<ActivityModel> searchList = [
  ActivityModel(
    name: "tony",
    time: "4h",
    message: "Tony Cho",
    subMessage: "26.6k followers",
    image: generateImageUrl(10),
  ),
  ActivityModel(
    name: "flowkater",
    time: "4h",
    message: "FLOWKATER",
    subMessage: "301k followers",
    image: generateImageUrl(10),
  ),
  ActivityModel(
    name: "kong",
    time: "5h",
    message: "Kong Designer",
    subMessage: "789k followers",
    image: generateImageUrl(42),
  ),
  ActivityModel(
    name: "eyes",
    time: "5h",
    message: "eyes magazine",
    subMessage: "130k followers",
    image: generateImageUrl(42),
  ),
  ActivityModel(
    name: "paul",
    time: "5h",
    message: "Paul Cho",
    subMessage: "123k followers",
    image: generateImageUrl(32),
  ),
];
