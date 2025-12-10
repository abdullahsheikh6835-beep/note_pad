import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authrepo {
  Stream<dynamic>? get obj => null;

  Future<void> textclass(
    String name,
    String work,
  ) async {
    try {
      String? userid = FirebaseAuth.instance.currentUser?.uid;
      final docid = FirebaseFirestore.instance
          .collection('users')
          .doc(userid)
          .collection('notes')
          .doc();
      final setobj = {'name': name, 'work': work};
      await docid.set(setobj);
    } catch (e) {
      rethrow;
    }
  }
}

Stream<List<Map<String, dynamic>>?> obj() {
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





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class authrepo {
//   Future<void> creatNotes(String work, String date, dynamic day) async {
//     try {
//       String? userId = FirebaseAuth.instance.currentUser?.uid;
//       final docid = FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .collection('notes')
//           .doc();
//       final obj = {
//         'id': userId,
//         'work': work,
//         'date': date,
//         'day': day,
//       };
//       await docid.set(obj);
//     } catch (e) {
//       rethrow;
//     }
//   }


//   Stream<List<Map<String, dynamic>>?> streamobj() {
//     try {
//       String? userid = FirebaseAuth.instance.currentUser?.uid;

//       Stream<QuerySnapshot<Map<String, dynamic>>> noteData = FirebaseFirestore
//           .instance
//           .collection("Users")
//           .doc(userid)
//           .collection("notes")
//           .snapshots();

//       return noteData.map((data) {
//         return data.docs.map((e) => e.data()).toList();
//       }
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
