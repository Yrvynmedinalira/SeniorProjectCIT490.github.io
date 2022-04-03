import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uneed/pages/addPost.dart';
import 'package:uneed/pages/chat.dart';
import 'package:uneed/pages/feedActivity.dart';
import 'package:uneed/pages/profile.dart';
import 'package:uneed/pages/search.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const Home(),
  const ChatPage(),
  const SearchUser(),
  ProfilePage(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),  
  const AddPost(),  
  
];
