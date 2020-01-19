import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({ this.uid });

  // add message to database
  Future updateMessages(String messageId, String channelId, String message) async {
    return await Firestore.instance.collection(channelId).document(messageId).setData({
      'messageId': messageId,
      'userId': uid,
      'channelId': channelId,
      'message': message,
    });
  }

  // message list from snapshot
  List<Message> _messageListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Message(
        id: doc.data['messageId'] ?? '',
        userId: doc.data['userId'] ?? '',
        message: doc.data['message'] ?? 'faulty message',
        channelId: doc.data['channelId'] ?? "0"
      );
    }).toList();
  }

  // get messages stream
  Stream<List<Message>> get(channelId) {
    return Firestore.instance.collection(channelId).snapshots()
      .map(_messageListFromSnapshot);
  }
}