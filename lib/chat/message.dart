class Message {
  final String messageText;
  final String id;
  final String name;

  Message(this.messageText, this.id, this.name);
  factory Message.fromjson(jsondata) {
    return Message(
      jsondata['message'],
      jsondata['id'],
      jsondata['name'],
    );
  }
}
