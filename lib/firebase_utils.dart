import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event.dart';
import 'package:evently_app/model/my_user.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection(String uId) {
    return getUsreCollection().doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event, String uId) {
    CollectionReference<Event> collectionRef = getEventsCollection(uId);
    DocumentReference<Event> docRef = collectionRef.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

  static CollectionReference<MyUser> getUsreCollection() {
    return FirebaseFirestore.instance.collection(MyUser.collectionName)
        .withConverter(
        fromFirestore: (snapshot, options) =>
            MyUser.fromFireStore(snapshot.data()!),
        toFirestore: (user, options) => user.toFireStore());
  }

  static Future<void> addUserToFirestore(MyUser myUser) {
    return getUsreCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String id) async {
    var querySnapshot = await getUsreCollection().doc().get();
    return querySnapshot.data();
  }
}
