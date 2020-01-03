import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String channelId;
  DatabaseService({ this.channelId });
  // collection reference
  final CollectionReference messageCollection = Firestore.instance.collection('messages');

  Future updateMessages(String messageId, String userId, String message) async {
    return await messageCollection.document(channelId).setData({
      'messageId': messageId,
      'userId': userId,
      'message': message
    });
  }
}