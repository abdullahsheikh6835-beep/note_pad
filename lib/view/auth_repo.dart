import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<void> creatNotes(String text, String note, String task) async {
    try {
      String? userid = FirebaseAuth.instance.currentUser?.uid;

      final docId = FirebaseFirestore.instance
          .collection("Users")
          .doc(userid)
          .collection("notes")
          .doc();
      log("our docid is ${docId.id}");
      log("our dco is ${docId}");
      Map<String, String> folders = {
        "id": docId.id,
        "Text": text,
        "Notes": note,
        "Tasks": task,
      };
      log("our docid is ${folders}");

      await docId.set(folders);
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Map<String, dynamic>>?> fetchNotesData() {
    try {
      String? userid = FirebaseAuth.instance.currentUser?.uid;

      Stream<QuerySnapshot<Map<String, dynamic>>> noteData = FirebaseFirestore
          .instance
          .collection("Users")
          .doc(userid)
          .collection("notes")
          .snapshots();

      return noteData.map((data) {
        return data.docs.map((e) => e.data()).toList();
      });
    } catch (e) {
      rethrow;
    }
  }
}















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthRepo {
//   Future<void> createAccount(
//     String email,
//     String password,
//     String fullname,
//   ) async {
//     try {
//       UserCredential userInfo = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       Map<String, dynamic> users = {
//         "userId": userInfo.user?.uid,
//         "email": email,
//         "password": password,
//         "fullName": fullname,
//       };

//       await FirebaseFirestore.instance
//           .collection("Users")
//           .doc(userInfo.user?.uid)
//           .set(users);
//     } catch (e) {
//       rethrow;
//     }
//   }



//   Future<Map<String, dynamic>?> login(String email, String password) async {
//     try {
//       UserCredential userInfo = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
//           .instance
//           .collection("Users")
//           .doc(userInfo.user?.uid)
//           .get();

//       return userData.data();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
