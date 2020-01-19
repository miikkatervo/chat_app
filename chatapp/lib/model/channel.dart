import '../model/message.dart';
import '../model/user.dart';

class Channel {
  String id;
  String image;
  String name;
  Channel({this.id, this.image, this.name});
}

var messages = [
  Message(id:"0", userId: users.uid,  message: "Rakastan temppareita <33", channelId: "0"),
  Message(id:"1", userId: users.uid,  message: "Miksi kukaan ei vastaa? :'(", channelId: "1")
];

var channels = [
  Channel(id: "0", image: "assets/images/yle1.png", name: "Yle 1", ),
  Channel(id: "1", image: "assets/images/yle2.png", name: "Yle 2"),
  Channel(id: "2", image: "assets/images/mtv3.png", name: "Mtv 3"),
  Channel(id: "3", image: "assets/images/nelonen.png", name: "Nelonen"),
  Channel(id: "4", image: "assets/images/sub.png", name: "Sub"),
  Channel(id: "5", image: "assets/images/tv5.png", name: "TV 5"),
  Channel(id: "6", image: "assets/images/fox.png", name: "Fox"),
];