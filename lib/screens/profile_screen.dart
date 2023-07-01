import 'package:fitflo_v2_1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ProfileScreen extends StatefulWidget {
  // static const String routeName = '/profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            //         appBar: AppBar(
            //   leading: IconButton(
            //     icon: Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            //   // Other AppBar properties
            // ),

            body: Padding(
              padding: EdgeInsets.all(16.sp),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(() {
                    if (authController.userList.isNotEmpty) {
                      return Column(
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/person.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              SizedBox(height: 20.h),
                              Text(
                                'First Name',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              TextFormField(
                                controller:
                                    authController.firstNameController.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Last Name',
                                style: TextStyle(
                                  fontSize: 16.h,
                                  color: Colors.grey,
                                ),
                              ),
                              TextFormField(
                                controller: authController.lastNameController.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.only(left: 10.sp),
                                child: Text(
                                  'Experience level',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0.w,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor: authController
                                                      .userList[0]
                                                      .experienceLevel! ==
                                                  "Beginner"
                                              ? MaterialStatePropertyAll<Color>(
                                                  Colors.red)
                                              : MaterialStatePropertyAll<Color>(
                                                  Colors.white)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Beginner',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor: authController
                                                      .userList[0]
                                                      .experienceLevel! ==
                                                  "Intermediate"
                                              ? MaterialStatePropertyAll<Color>(
                                                  Colors.red)
                                              : MaterialStatePropertyAll<Color>(
                                                  Colors.white)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Intermediate',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor: authController
                                                      .userList[0]
                                                      .experienceLevel! ==
                                                  "Advanced"
                                              ? MaterialStatePropertyAll<Color>(
                                                  Colors.red)
                                              : MaterialStatePropertyAll<Color>(
                                                  Colors.white)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Advanced',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Pick a gym',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Test - FC',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Save changes',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Container(
                      );
                    }
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
