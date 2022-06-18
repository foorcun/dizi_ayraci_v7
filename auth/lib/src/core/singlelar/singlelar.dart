import '../../features/user/domain/entities/BenimUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

final fireStore = FirebaseFirestore.instance;

final fireAuth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();
late BenimUser myUser;
