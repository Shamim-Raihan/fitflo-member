import 'package:fitflo_v2_1/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../../constants/colors.dart';
import '../../../bottom_navigation.dart';
import '../../data/model/login_user_input.dart';
import '../../repository/firebase_database.dart';
import 'component/login_widget.dart';

class LoginScreen extends StatefulWidget {
  // static const String routeName = "/login";
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool remember = false;
  bool isHovered = false;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 0,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                SizedBox(height: 20.sp,),
                Image.asset(
                  'assets/images/logo.png',
                  width: 153,
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 25),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: AppColors.blackcolor),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    myTextField('email',
                        text: 'Email',
                        controller: _emailController),
                    const SizedBox(
                      height: 30,
                    ),
                    myTextField('password',
                        text: "Password",
                        controller: _passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0),
                      child: Row(
                        children: [
                          remeberMe(
                              value: remember,
                              onChanged: (value) {
                                setState(() {
                                  remember = value!;
                                });
                              }),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          FirebaseDatabase()
                              .login(LoginUserInput(
                                  email: _emailController.text,
                                  password:
                                      _passwordController.text))
                              .then((value) {
                            Get.to(BottomNavigation());
                          });
                        },
                        child: buildAuthButton("Log in")),
                    const SizedBox(
                      height: 20,
                    ),
                    // Center(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       const Text("Don't have an account? "),
                    //       InkWell(
                    //         onTap: () {
                    //           Navigator.pushNamed(
                    //               context, SignUpScreen.routeName);
                    //         },
                    //         child: MouseRegion(
                    //           onEnter: (event) {
                    //             setState(() {
                    //               isHovered = true;
                    //             });
                    //           },
                    //           onExit: (event) {
                    //             setState(() {
                    //               isHovered = false;
                    //             });
                    //           },
                    //           child: Text(
                    //             'Sign Up',
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               decoration: isHovered
                    //                   ? TextDecoration.underline
                    //                   : TextDecoration.none,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
