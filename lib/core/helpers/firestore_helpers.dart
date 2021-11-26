import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:portofolio/features/auth/data/datasources/auth_remote_data_source.dart';

import '../../injectable.dart';

extension FirebasestorageX on FirebaseStorage {
  Reference storageUserRef(String userId) {
    var _data = FirebaseStorage.instance.ref('user_image/$userId');
    return _data;
  }
}

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<AuthRemoteDataSource>().getSignedInUser();
    final user = userOption.getOrElse(() => throw Error());
    return FirebaseFirestore.instance.collection('users').doc(user.uid);
  }

  Future<DocumentReference> userDocumentWithKnownId(String userId) async {
    return FirebaseFirestore.instance.collection('users').doc(userId);
  }

  Future<DocumentReference> headerDocument(String userId,String locale) async {
    return FirebaseFirestore.instance.collection("landingPage").doc(userId).collection(locale).doc("header");
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get userCollection => collection('users');
  CollectionReference get landingPageCollection => collection('landingPage');
}
