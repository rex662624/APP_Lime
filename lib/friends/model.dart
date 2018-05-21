class FriendModel {
  String name;

  String avatarUrl;

  //constructor
  FriendModel({this.name, this.avatarUrl});
}

List<FriendModel> FriendData = [
  new FriendModel(name: "Thor", avatarUrl: "./assets/9.png"),
  new FriendModel(name: "Captain", avatarUrl: "./assets/10.png"),
  new FriendModel(name: "Stark", avatarUrl: "./assets/8.png"),
  new FriendModel(name: "Hulk", avatarUrl: "./assets/12.jpg"),
  new FriendModel(name: "My Dog", avatarUrl: "./assets/doge.jpg"),
  new FriendModel(name: "Li", avatarUrl: "./assets/7.png"),
  new FriendModel(name: "Hen", avatarUrl: "/assets/2.png"),
  new FriendModel(name: "Tommy", avatarUrl: "/assets/6.png"),
  new FriendModel(name: "Amy", avatarUrl: "./assets/1.png"),
  new FriendModel(name: "Tim", avatarUrl: "/assets/5.png"),
  new FriendModel(name: "BatMan", avatarUrl: "/assets/3.jpg"),
  new FriendModel(name: "SuperMan", avatarUrl: "./assets/11.png"),
  new FriendModel(name: "Ken", avatarUrl: "/assets/4.png"),
];
