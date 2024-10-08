import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String? uid;
  DatabaseService({this.uid});
  // Collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get("name") ?? '',
        strength: doc.get("strength") ?? 0,
        sugars: doc.get("sugars") ?? '0',
      );
    }).toList();
  }

  // Get brew stream
  Stream<List<Brew>?> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
