// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:intl/intl.dart';

// class AuthService {
//   // UserController userController = Get.put(UserController());
//   static final FirebaseAuth _auth = FirebaseAuth.instance;

//   static User? get user => _auth.currentUser;

//   static Future<bool> login(String email, String password) async {
//     final credential = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//     return credential.user != null;
//   }

//   static Future<void> register(
//       {required String name, required String email, required String password}) async {
//     final credential = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     final userModel = UserModel(
//       userId: credential.user!.uid,
//       image: '',
//       email: credential.user!.email,
//       name: name,
//       location: '',
//       gymName: '',
//       equipment: [],
//       lastActive: DateFormat('dd/MM/yyyy').format(DateTime.now()),
//       ofMember: '',
//       ofPremises: '',
//       role: 'operator',
//       status: true,
//       website: '',
//     );

//     return UserRepository.insertUserData(userModel);
//   }

//   static Future<void> addUser(UserModel userModel) =>
//       addUser(userModel);

//   static Future<void> logout() => _auth.signOut();
// }