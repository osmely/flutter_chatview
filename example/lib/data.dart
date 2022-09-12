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

  static final currentUser =
      ChatUser(id: '2', name: 'Simform', profilePhoto: Data.profileImage);

  static List<ChatUser> allUsers = [currentUser, user1, user2, user3];

  static const profileImage =
      "https://raw.githubusercontent.com/SimformSolutionsPvtLtd/flutter_showcaseview/master/example/assets/simform.png";
  static final messageList = [
    Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 4),
      sendById: user1.id,
    ),
    Message(
      id: '2',
      message: "Hi!",
      createdAt: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
      sendById: user2.id,
    ),
    Message(
      id: '3',
      message: "We can meet?I am free",
      createdAt: DateTime.now(),
      sendById: user1.id,
    ),
    Message(
      id: '4',
      message: "Can you write the time and place of the meeting?",
      createdAt: DateTime.now(),
      sendById: user2.id,
    ),
    Message(
      id: '5',
      message: "That's fine",
      createdAt: DateTime.now(),
      sendById: user1.id,
      reaction: '❤️❤️❤️',
    ),
    Message(
      id: '6',
      message: "mmmmmm",
      createdAt: DateTime.now(),
      sendById: user1.id,
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
      sendById: user2.id,
    ),
    Message(
      id: '8',
      message: "Thank you!!",
      createdAt: DateTime.now(),
      sendById: user1.id,
    ),
    Message(
      id: '9',
      message:
          "https://cdn.pixabay.com/photo/2017/11/04/13/43/texture-2917553_1280.jpg",
      createdAt: DateTime.now(),
      messageType: MessageType.image,
      sendById: user1.id,
      reaction: '❤️',
    ),
    Message(
      id: '10',
      message: "🤩🤩",
      createdAt: DateTime.now(),
      sendById: user3.id,
    ),
    Message(
      id: '11',
      message: ":head:",
      createdAt: DateTime.now(),
      messageType: MessageType.text,
      sendById: user1.id,
      reaction: '❤️',
    ),
  ];
}
