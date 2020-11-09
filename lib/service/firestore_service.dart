import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamburgueria_gado_dmais/models/entry.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Get Entries
  Stream<List<Entry>> getEntries() {
    return _db
        .collection('entries')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs
            .map((doc) => Entry.fromJson(doc.data()))
            .toList());
  }

  //Upsert
  Future<void> setEntry(Entry entry) {
    var options = SetOptions(merge: true);

    return _db
        .collection('entries')
        .doc(entry.entryId)
        .set(entry.toMap(), options);
  }

  //Delete
  Future<void> removeEntry(String entryId) {
    return _db
        .collection('entries')
        .doc(entryId)
        .delete();
  }

}
