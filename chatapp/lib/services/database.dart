import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference messageCollection = Firestore.instance.collection('messages');

  Future updateMessages(String messageId, String channelId, String message) async {
    return await messageCollection.document(uid).setData({
      'messageId': messageId,
      'channelId': channelId,
      'message': message,
    });
  }

  // message list from snapshot
  List<Message> _messageListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Message(
        id: doc.data['id'] ?? '',
        userId: doc.data['id'] ?? '',
        message: doc.data['message'] ?? 'faulty message',
        channelId: doc.data['channelId'] ?? "0"
      );
    }).toList();
  }

  // get messages stream
  Stream<List<Message>> get messages {
    return messageCollection.snapshots()
      .map(_messageListFromSnapshot);
  }
}