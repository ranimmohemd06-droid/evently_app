class Event {
  static const String collectionName = 'Events';

  String id;
  String title;
  String description;
  String eventImage;
  String eventName;
  DateTime eventDateTime;
  String eventTime;
  bool isFavorite;

  Event({
    this.id = '',
    required this.title,
    required this.description,
    required this.eventName,
    required this.eventDateTime,
    required this.eventImage,
    required this.eventTime,
    this.isFavorite = false,
  });

  Event.fromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        eventName: data['event_name'],
        eventImage: data['event_image'],
        eventTime: data['event_time'],
        eventDateTime: DateTime.fromMillisecondsSinceEpoch(
          data['event_date_time'],
        ),
        isFavorite: data['is_favorite'],
      );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'event_image': eventImage,
      'event_name': eventName,
      'event_time': eventTime,
      'event_date_time': eventDateTime.millisecondsSinceEpoch,
      'is_favorite': isFavorite,
    };
  }
}
