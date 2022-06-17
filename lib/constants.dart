import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tik_tok_flutter/controllers/auth_controller.dart';
import 'package:tik_tok_flutter/views/screens/add_video_screen.dart';
import 'package:tik_tok_flutter/views/screens/video_screen.dart';

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
late var uid = firebaseAuth.currentUser!.uid;

//Page navigation Bar
final pages = [
  VideoScreen(),
  Text("Search Screen"),
  AddVideoScreen(),
  Text("Message Screen"),
  Text("Profile Screen"),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// CONTROLLERS
var authController = AuthController.instance;
