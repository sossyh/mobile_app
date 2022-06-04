class Comment {
  final int? id;
  final String text;

  Comment({
    required this.id,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      text: json['text'],
    );
  }
}
