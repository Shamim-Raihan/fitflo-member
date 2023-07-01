import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static const String collectionUsers = 'users';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserData() {
    return _db
        .collection(collectionUsers)
        .doc('U2010uhrfLS8pPf2XZHK')
        .collection(collectionUsers)
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
  // getUserData() {
  //   log(FirebaseAuth.instance.currentUser.);
  // }
}
