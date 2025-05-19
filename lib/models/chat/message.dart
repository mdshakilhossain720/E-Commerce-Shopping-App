class Message {
 final String id;
 final String text;
 final String senderId;
 final bool isRead;
  final DateTime dateTime;

  Message({
    required this.id,
    required this.text,
    required this.senderId,
    required this.isRead,
    required this.dateTime,
  });
}
