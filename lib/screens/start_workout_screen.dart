import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';

class StartWorkoutScreen extends StatefulWidget {
  const StartWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  bool showDescription = false;
  bool showInstruction = false;
  bool showTips = false;

  final TextEditingController _textEditingControllerRepetition = TextEditingController();
  final TextEditingController _textEditingControllerWeight = TextEditingController();

  List<String> itemList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: 20.sp),
                    Text(
                      'Return',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 400.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  'Youtube Portion',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 50.h,
                width: 200.w,
                child: Row(
                  children: [
                    _buildTabButton(0, 'View details'),
                    _buildTabButton(1, 'Log exercise'),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildContainer(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(int index, String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Center(
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: _currentPageIndex == index
                      ? Colors.blueAccent
                      : Colors.black,
                ),
              ),
              Divider(
                  color: _currentPageIndex == index
                      ? Colors.blueAccent
                      : Colors.transparent)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index) {
    return index == 0
        ? Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beginner',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Sets: 1',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Reps: 1',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 5.h,
                      color: AppColors.colorDisabled,
                    ),
                  ),
                  Text(
                    'Secondary muscle groups',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = itemList[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const StartWorkoutScreen()));
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 5.h,
                      color: AppColors.colorDisabled,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showDescription = !showDescription;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(showDescription
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Divider(
                        height: 5.h,
                        color: AppColors.colorDisabled,
                      ),
                    ),
                  ),
                  if (showDescription)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dumy Texts',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Divider(
                                height: 5.h,
                                color: AppColors.colorDisabled,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showInstruction = !showInstruction;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(showInstruction
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down),
                          Text(
                            'Instructions',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 5.h,
                      color: AppColors.colorDisabled,
                    ),
                  ),
                  if (showInstruction)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dumy Texts',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Divider(
                            height: 5.h,
                            color: AppColors.colorDisabled,
                          ),
                        ),
                      ],
                    ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showTips = !showTips;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(showTips
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down),
                          Text(
                            'Tips',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 5.h,
                      color: AppColors.colorDisabled,
                    ),
                  ),
                  if (showTips)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dumy Texts',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Divider(
                            height: 5.h,
                            color: AppColors.colorDisabled,
                          ),
                        ),
                      ],
                    ),
                  Text(
                    'Exercise mechanics',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Compound',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 5.h,
                      color: AppColors.colorDisabled,
                    ),
                  ),
                  Text(
                    'Exercise Movement Force Type',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pull',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set 1',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text('# of repetitions'),
                  SizedBox(
                    height: 40.h,
                    child: TextField(
                      controller: _textEditingControllerRepetition,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter text',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  const Text('Weight (kg) - if applicable'),
                  SizedBox(
                    height: 40.h,
                    child: TextField(
                      controller: _textEditingControllerWeight,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter text',
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(
                            'Add another set',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(
                            'Log exercise',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
