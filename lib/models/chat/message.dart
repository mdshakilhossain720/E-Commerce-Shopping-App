class MessageUser {
 final String id;
 final String text;
 final String senderId;
 final bool isRead;
   final DateTime timestamp;

  MessageUser({
    required this.id,
    required this.text,
    required this.senderId,
    required this.isRead ,
    required this.timestamp,
  });
}
