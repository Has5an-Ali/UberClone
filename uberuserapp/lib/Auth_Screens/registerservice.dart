// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> SignUp({required email, required password}) async {
  final auth = FirebaseAuth.instance;

  final UserCredential = auth.createUserWithEmailAndPassword(email: email, password: password).then(value){
    

  }
}
