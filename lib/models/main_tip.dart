import 'dart:collection';

class MainTip {


  final String id;
  final String text;
  int likes;
  List<String> usersWhoLiked = [
  ];

  MainTip({required this.id, required this.text, this.likes = 0});

  /// Adds a like to the likes count and add given user name
  /// to usersWhoLiked
  void addLike(String username) {
    usersWhoLiked.add(username);
    likes += 1;
  }

  /// Removes a like from the likes count and removes
  /// given username from usersWhoLiked
  void removeLike(String username) {
    usersWhoLiked.removeWhere((String element) => element == username);
    likes -= 1;
  }

  /// gets String username and returns if the user has liked the tip or not
  bool didLike(String username) {
    return usersWhoLiked.contains(username);
  }
}