
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../data/model/login_user_input.dart';
import '../domain/login_domain.dart';

class FirebaseDatabase extends LoginRepo {
  @override
  Future<bool> login(LoginUserInput loginUserInput) async {
    try {
      EasyLoading.show();
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginUserInput.email, password: loginUserInput.password);
              EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        return false;
      } else if (e.code == 'wrong-password') {
        return false;
      }
    }
    return true;
  }

}
