

import '../data/model/login_user_input.dart';

abstract class LoginRepo{

  Future<bool> login(LoginUserInput loginUserInput);
  
}