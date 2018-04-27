class ChatModel {
  String name;
  String message;
  String time;
  String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Amy",
      message: "哈哈 我先洗澡!",
      time: "8:30",
      avatarUrl:
          "./assets/1.png"),
  new ChatModel(
      name: "Hen",
      message: "咕咕咕 起床",
      time: "7:30",
      avatarUrl:
          "/assets/2.png"),
  new ChatModel(
      name: "BatMan",
      message: " I'm bad man! Oops, batman",
      time: "17:00",
      avatarUrl:
          "/assets/3.jpg"),
  new ChatModel(
      name: "Ken",
      message: "出乃玩",
      time: "4:30",
      avatarUrl:
          "/assets/4.png"),
  new ChatModel(
      name: "不要回他!!",
      message: "欠錢不還喔 出來啊",
      time: "17:30",
      avatarUrl:
          "/assets/5.png"),
  new ChatModel(
      name: "Tommy",
      message: "你聽過安麗嗎?",
      time: "15:30",
      avatarUrl:
          "/assets/6.png"),
];
