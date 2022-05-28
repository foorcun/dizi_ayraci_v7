// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dizi_ayraci_v7/features/dizi/data/datasources/dizi_remote_data_source.dart';
// import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';

// class DiziFirebaseRemoteDataSourceImpl implements DiziRemoteDataSource {
//   // final rootColectionName = "users/foorcun@gmail.com/userDiziler";
//   final rootColectionName = "diziler";

//   final FirebaseFirestore firebaseStore;

//   DiziFirebaseRemoteDataSourceImpl({
//     required this.firebaseStore,
//   });

//   @override
//   Stream<List<DiziModel>> getAllDiziler() {
//     // try {
//     var as =
//         firebaseStore.collection(rootColectionName).snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((doc) => DiziModel.fromJson(json: doc.data()))
//           .toList();
//     });
//     return as;
//     // }
//     //  catch (e) {
//     //   throw ServerException();
//     // }
//   }
// }
