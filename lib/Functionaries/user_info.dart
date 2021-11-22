/*import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';*/

class GetUserInformation {

  final String username;
  final String profilePic;
  final String location;
  final String description;
  final String uid;

  GetUserInformation(
      {required this.username,required this.profilePic,required this.location,required this.description,required this.uid}
      );

  factory GetUserInformation.fromRTDB(Map<String, dynamic> data ) {
    return GetUserInformation(username: data['username'],profilePic: data['profilePic'], location: data['location']
        ,description: data['description'], uid: data['uid']);
  }
  String getUsername() {
    return username.toString();
  }
  String getProfilePic() {
    return profilePic.toString();
  }
  String getLocation() {
    return location.toString();
  }
  String getDescription() {
    return description.toString();
  }
  String getUID() {
    return uid.toString();
  }
}
