import 'package:fitflo_v2_1/screens/equipment_screen.dart';
import 'package:fitflo_v2_1/screens/profile_screen.dart';
import 'package:fitflo_v2_1/screens/status_screen.dart';
import 'package:fitflo_v2_1/screens/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const WorkoutsScreen(),
    const EquipmentScreen(),
    StatusScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/home.png"),
      ),
      activeIcon: ImageIcon(
        AssetImage("assets/images/home.png"),
      ),
      label: 'Workouts',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/body.png"),
      ),
      activeIcon: ImageIcon(
        AssetImage("assets/images/body.png"),
      ),
      label: 'Workouts',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/barbell.png"),
      ),
      activeIcon: ImageIcon(
        AssetImage("assets/images/barbell.png"),
      ),
      label: 'Equipment',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage("assets/images/status.png"),
      ),
      activeIcon: ImageIcon(
        AssetImage("assets/images/status.png"),
      ),
      label: 'Status',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   title: SvgPicture.asset("assets/images/app_logo.svg", height: 80.h),
      //   actions: [
      //     Row(
      //       children: [
      //         SvgPicture.asset("assets/images/user_image.svg", height: 35.h),
      //         SizedBox(width: 20.w),
      //         Icon(
      //             Icons.menu,
      //           color: AppColors.colorDisabled,
      //           size: 30.sp,
      //         ),
      //         SizedBox(width: 10.w),
      //       ],
      //     )
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('FitFlo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {

            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen()));
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Material(
        type: MaterialType.transparency,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: _bottomNavBarItems,
          selectedItemColor: AppColors.colorActiveBottomNavText,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
