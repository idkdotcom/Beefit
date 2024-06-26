import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {

  // Get instance firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc){
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  // Send message

  // Get message

}