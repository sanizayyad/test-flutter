
enum MessageType{
  Danger,
  Primary,
  Warning,
  Success,
}
class MessageError{
  String? message;
  MessageType? type;

  MessageError({this.message, this.type});
}