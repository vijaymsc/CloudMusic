import 'dart:convert';

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
  
  
  ///getAllGroupName
  List<GetGroupData> getGroupData = [];

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
    await groupCollection.doc(groupName).set({
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
      final List list = snapshot.docs.map((doc) => doc.data()).toList();
      print(list);
      for (var item in list) {
        getGroupData.add(GetGroupData.fromJson(item));
      }
      notifyListeners();
    } catch (e) {
      showLog(e.toString());
    }
  }

  Future getCollectionDocIds() async {
    try {
      QuerySnapshot result = await groupCollection.get();
      for (var element in result.docs) {
        showLog(element.id);
      }
    } catch (e, stackTrace) {
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




GetGroupData getGroupDataFromJson(String str) => GetGroupData.fromJson(json.decode(str));

String getGroupDataToJson(GetGroupData data) => json.encode(data.toJson());

class GetGroupData {
  String? groupId;
  String? groupName;
  String? admin;
  String? groupIcon;
  List<String>? members;
  List<String>? music;

  GetGroupData({
    this.groupId,
    this.groupName,
    this.admin,
    this.groupIcon,
    this.members,
    this.music,
  });

  factory GetGroupData.fromJson(Map<String, dynamic> json) => GetGroupData(
    groupId: json["groupId"],
    groupName: json["groupName"],
    admin: json["admin"],
    groupIcon: json["groupIcon"],
    members: json["members"] == null ? [] : List<String>.from(json["members"]!.map((x) => x)),
    music: json["music"] == null ? [] : List<String>.from(json["music"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "groupId": groupId,
    "groupName": groupName,
    "admin": admin,
    "groupIcon": groupIcon,
    "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
    "music": music == null ? [] : List<dynamic>.from(music!.map((x) => x)),
  };
}
