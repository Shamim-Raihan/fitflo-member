

class LoginUserInput{

  final String email;
  final String password;

  LoginUserInput({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}