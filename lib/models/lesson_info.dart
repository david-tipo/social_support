class LessonInfo {
  
  final String title;
  final String details;
  String? imageUrl;
  String username;
  
  LessonInfo({
    required this.title, 
    required this.username,
    required this.details,
    this.imageUrl,
});
  
}