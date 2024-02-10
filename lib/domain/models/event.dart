class Event {
  String time;
  String title;
  String? description;
  Event({
    required this.time,
    required this.title,
    this.description,
  });
}
