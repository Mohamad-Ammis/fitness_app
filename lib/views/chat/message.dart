class Message {
  final String messageText;
  final String id;
  final String name;
  final String image;

  Message(this.messageText, this.id, this.name, this.image);
  factory Message.fromjson(jsondata) {
    return Message(
      jsondata['message'],
      jsondata['id'],
      jsondata['name'],
      jsondata['image'],
    );
  }
}
