
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import 'exercises_screen.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  bool showSecondDropdown = false;
  String? selectedSecondDropdown;

  final List<String> secondDropdownOptions = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Full Body for Beginners',
      'category': 'Beginner',
      'exercises': '1',
      'objective': 'Strength'
    },
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Full Body for Beginners',
      'category': 'Beginner',
      'exercises': '1',
      'objective': 'Strength'
    },
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Full Body for Beginners',
      'category': 'Beginner',
      'exercises': '1',
      'objective': 'Strength'
    },
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Full Body for Beginners',
      'category': 'Beginner',
      'exercises': '1',
      'objective': 'Strength'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int columnCount = (screenWidth ~/ 200).clamp(1, 4);

    return Scaffold(
      backgroundColor: AppColors.colorScaffold,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Workouts',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '7 results',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showSecondDropdown = !showSecondDropdown;
                  });
                },
                child: Container(
                  height: 35.h,
                  width: 150.w,
                  padding:
                   EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Filters (1)',
                        style: TextStyle(
                            color: AppColors.colorActiveBottomNavText,
                            fontSize: 14.sp),
                      ),
                      const SizedBox(width: 8),
                      Icon(showSecondDropdown
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  Column(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columnCount,
                          mainAxisSpacing: 18.0,
                          crossAxisSpacing: 18.0,
                          childAspectRatio: 1.0,
                        ),
                        shrinkWrap: true,
                        itemCount: itemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = itemList[index];

                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>  ExercisesScreen(
                                        title: item['title'],
                                        category: item['category'],
                                        objective: item['objective'],
                                      )));
                            },
                            child: Expanded(
                              flex: 2,
                              child: Card(
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft:Radius.circular(8.0),
                                              topRight: Radius.circular(8.0)
                                          ),
                                          child: Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              item['image'],
                                            ),
                                          )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 16.0),
                                            Text(
                                              item['title'],
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Text(
                                              item['category'],
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black54
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Text(
                                              'Exercises: ${item['exercises']}',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.black54
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Text(
                                              'Objective: ${item['objective']}',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.black54
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  if (showSecondDropdown)
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: 250.w,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Experience Level',
                              style: TextStyle(
                                  fontSize: 14.sp
                              ),
                            ),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: selectedSecondDropdown,
                              hint: const Text('Select an option'),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedSecondDropdown = newValue!;
                                });
                              },
                              items: secondDropdownOptions.map((option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showSecondDropdown = !showSecondDropdown;
                                      });
                                    },
                                    child: Text(
                                      'Clear',
                                      style: TextStyle(
                                          color: AppColors.colorDisabled,
                                          fontSize: 14.sp),
                                    )),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showSecondDropdown = !showSecondDropdown;
                                      });
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.white),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
