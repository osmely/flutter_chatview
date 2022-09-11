import 'package:chatview/chatview.dart';

class Data {
  static final user1 = ChatUser(
    id: '1',
    name: 'Flutter',
    profilePhoto:
        "https://docs.flutter.dev/assets/images/docs/catalog-widget-placeholder.png",
  );

  static final user2 = ChatUser(
    id: '2',
    name: 'Simform',
    profilePhoto: Data.profileImage,
  );

  static final user3 = ChatUser(
    id: '3',
    name: 'Juan',
    profilePhoto: Data.profileImage,
  );

  final yesterday = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);

  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";
  static final messageList = [
    Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 4),
      sendBy: user1,
    ),
    Message(
      id: '2',
      message: "Hi!",
      createdAt: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
      sendBy: user2,
    ),
    Message(
      id: '3',
      message: "We can meet?I am free",
      createdAt: DateTime.now(),
      sendBy: user1,
    ),
    Message(
      id: '4',
      message: "Can you write the time and place of the meeting?",
      createdAt: DateTime.now(),
      sendBy: user2,
    ),
    Message(
      id: '5',
      message: "That's fine",
      createdAt: DateTime.now(),
      sendBy: user1,
      reaction: '❤️❤️❤️',
    ),
    Message(
      id: '6',
      message: "mmmmmm",
      createdAt: DateTime.now(),
      sendBy: user1,
      replyMessage: ReplyMessage(
        message: "Can you write the time and place of the meeting?",
        replyTo: '1',
        replyBy: '3',
      ),
    ),
    Message(
      id: '7',
      message: "Done",
      createdAt: DateTime.now(),
      sendBy: user2,
    ),
    Message(
      id: '8',
      message: "Thank you!!",
      createdAt: DateTime.now(),
      sendBy: user1,
    ),
    Message(
      id: '9',
      message:
          "https://bs-uploads.toptal.io/blackfish-uploads/components/seo/content/og_image_file/og_image/777695/0408-FlutterMessangerDemo-Luke_Social-e8a0e8ddab86b503a125ebcad823c583.png",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendBy: user1,
      reaction: '❤️',
    ),
    Message(
      id: '10',
      message: "🤩🤩",
      createdAt: DateTime.now(),
      sendBy: user3,
    ),
    Message(
      id: '11',
      message: ":head:",
      createdAt: DateTime.now(),
      messageType: MessageType.text,
      sendBy: user1,
      reaction: '❤️',
    ),
  ];
}
