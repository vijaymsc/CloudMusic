import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../UI/shared_prefrance/shared_preference_const.dart';
import '../UI/shared_prefrance/shared_prefrance_helper.dart';

class FirebaseProvide extends ChangeNotifier {
  ///Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  bool btnLoading = false;

  ///login
  String loginErrorMsg = '';

  List<dynamic> user = [];

  ///create user
  Future<User?> createUser(String userEmail, password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      showLog(e.code!);
    }
    notifyListeners();
    return null;
  }

  ///login user
  Future<User?> loginUser(String userEmail, password) async {
    try {
      btnLoading = true;
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: password);
      btnLoading = false;
      if (kDebugMode) {
        print('credential::${credential.user!.uid}');
      }
      PreferenceHelper.setBool(PreferenceConstant.userLoginStatus, true);
      PreferenceHelper.setString(
          PreferenceConstant.userLoginId, credential.user!.uid);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      loginErrorMsg = e.message!;
      showLog(e.code!);
    }
    notifyListeners();
    return null;
  }

  ///logout user
  Future<bool> logOut() async {
    try {
      _auth.signOut();
      PreferenceHelper.clearPreference();
      return true;
    } on FirebaseAuthException catch (e) {
      showLog(e.code!);
    }
    notifyListeners();
    return false;
  }

  ///Re_setPassword
  Future<bool> reSetPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email).then((value) {
        showLog('reset');
      });
      return true;
    } on FirebaseAuthException catch (e) {
      showLog(e.code!);
    }
    notifyListeners();
    return false;
  }

  Future createGroup(
      {required String groupName, userId, adminName, groupId}) async {
    user.add(userId);
    DocumentReference groupDocRef = await groupCollection.add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': adminName,
      'members': user.toSet(),
      'groupId': groupId,
      'music': [],
    });
    notifyListeners();
  }

  Future addMemberInGroup({required String grpDocumentId, userId}) async {
    try {
      await getMemberLis(grpDocumentId: grpDocumentId, fieldId: "members");
      user.add(userId);
      final snapshot = await groupCollection.doc(grpDocumentId).update({
        'members': user,
      });
      notifyListeners();
    } catch (e) {
      showLog(e.toString());
    }
  }

  Future getMemberLis({required String grpDocumentId, fieldId}) async {
    try {
      await groupCollection.doc(grpDocumentId).get().then((snapshot) {
        user = snapshot.get(fieldId);
      });
      notifyListeners();
    } catch (e) {
      showLog(e.toString());
    }
  }

  getAllGroupList() async {
    try {
      final snapshot = await groupCollection.get();
      List<QueryDocumentSnapshot> value = snapshot.docs;
      //  final data = snapshot.data() as Map<String, dynamic>;
      //  print('snapshot::lllll${value.}');
      //  print('data::$data');
      notifyListeners();
    } catch (e) {
      showLog(e.toString());
    }
  }
}

/// print log data
showLog(String message) {
  if (kDebugMode) {
    print(message);
  }
}

customShowSnackBar(BuildContext context, {String message = ""}) {
  ScaffoldMessenger.of(context).showSnackBar(showSnackBar(message));
}

showSnackBar(String contentTitle) {
  return SnackBar(
    content: Text(contentTitle),
  );
}
