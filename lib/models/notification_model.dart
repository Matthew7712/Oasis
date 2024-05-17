import 'dart:convert';

List<Notification> hotelFromJson(String str) => List<Notification>.from(json.decode(str).map((x) => Notification.fromJson(x)));

class Notification {
  final String title;
  final String body;

  Notification({
    required this.title,
    required this.body,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}
