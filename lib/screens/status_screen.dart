
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bar graph/bar_data.dart';
import '../bar graph/bar_graph.dart';

class StatusScreen extends StatefulWidget {
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10,
    50,
    100,
    20,
    88.99,
    90.10
  ];
 

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Add parentheses after "dispose"
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sun: weeklySummary[0],
        mon: weeklySummary[1],
        tue: weeklySummary[2],
        wed: weeklySummary[3],
        thur: weeklySummary[4],
        fri: weeklySummary[5],
        sat: weeklySummary[6]);
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
             color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:  EdgeInsets.all(8.0.sp),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '🎯 Statistics',
                      style:
                          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Here is how you are tracking!'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Workouts \nCompleted',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 2,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/wlogo.png'),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0.sp),
                                child: Text(
                                  '10',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Exercises \nLogged',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/body.png'),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0.sp),
                                child: Text(
                                  '64',
                                  style: TextStyle(fontSize: 35.sp),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.all(20.0.sp),
                          child: MyBarGraph(weeklySummary: weeklySummary,),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 250.0.sp),
                          child: Text(
                            'History Log',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.white,
                          tabs: const [
                            Tab(
                              text: 'Workouts',
                            ),
                            Tab(
                              text: 'Exercises',
                            ),
                            Tab(
                              text: 'Badges',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController, // Add this line
                            children: [
                              ListView.builder(
                                itemCount: 4, // Set the number of items
                                itemBuilder: (context, index) {
                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Card(
                                        child: Stack(
                                          children: [
                                            Expanded(
                                              flex:2,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                  width:MediaQuery.of(context).size.width, // Set the desired width
                                                  height: 150.h,
                                                  color: Colors.grey.shade700,// Set the desired height
                                                  child: Image.asset(
                                                    'assets/images/pushup.png', // Replace with your image path
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 8,
                                              left: 8,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Upper Body',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30.sp,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  ElevatedButton(onPressed: (){},

                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Color(0xff28E7FB), // Set the desired button color
                                                      ),child: Text('Beginner',style: TextStyle(color: Colors.white),))
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 8,
                                              right: 8,
                                              child: Row(
                                                children: [
                                                  ImageIcon(
                                                    AssetImage("assets/images/Group.png",),color:Color(0xff28E7FB) ,
                                                  ),
                                                  // Icon(Icons.done, color: Color(0xff28E7FB)),
                                                  SizedBox(width: 8),
                                                  Icon(Icons.bookmark_border, color: Colors.white),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 8,
                                              left: 8,
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.transparent, // Set the desired button color
                                                      ),
                                                      onPressed: (){}, child: Row(
                                                    children: [
                                                      ImageIcon(
                                                        AssetImage("assets/images/walk.png",),color:Colors.white ,
                                                      ),
                                                      SizedBox(width: 2.w,),
                                                      Text('12 Excercises',style: TextStyle(color: Colors.white),),
                                                    ],
                                                  )),
                                                  SizedBox(width: 8),
                                                  ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.transparent, // Set the desired button color
                                                      ),
                                                      onPressed: (){}, child: Row(
                                                    children: [
                                                      ImageIcon(
                                                        AssetImage("assets/images/Vector.png",),color:Colors.white ,
                                                      ),
                                                      SizedBox(width: 2.w,),
                                                      Text('1hr +',style: TextStyle(color: Colors.white),),
                                                    ],
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                itemCount: 1, // Set the number of items
                                itemBuilder: (context, index) {
                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Card(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex:3,
                                              child: Image.asset(
                                                'assets/images/image 14.png', // Replace with your image path
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width:40.w),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Leg Press ',
                                                  style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  'Resistance Machine',
                                                  style: TextStyle(fontSize: 14.sp),
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  'Logged: 18/06/2023',
                                                  style: TextStyle(fontSize: 14.sp),
                                                ),
                                                SizedBox(height: 3.h,),
                                                Row(children: [
                                                  Text(
                                                    '3 Sets',
                                                    style: TextStyle(
                                                      color: Color(0xff28E7FB),
                                                      fontSize: 13.sp,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,),
                                                  Text(
                                                    '10 Reps',
                                                    style: TextStyle(
                                                      color: Color(0xff28E7FB),

                                                      fontSize: 13.sp,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w,),
                                                  Text(
                                                    '100 kgs',
                                                    style: TextStyle(
                                                        color: Color(0xff28E7FB),

                                                        fontSize: 13.sp
                                                    ),
                                                  ),
                                                ],)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                itemCount: 1, // Set the number of items
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:  EdgeInsets.all(12.0.sp),
                                    child: Card(
                                      color: Colors.white,
                                      child: SizedBox(
                                        height: 100.h,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(left: 20.0.sp),
                                              child: SizedBox(
                                                height: 50.h,
                                                child: Image.asset(
                                                  'assets/images/stopwatch.png', // Replace with your image path
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width:20.w),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,

                                                children: [
                                                  Text(
                                                    'Building momentum ',
                                                    style:  TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16.sp,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    '10th workout complete',
                                                    style: TextStyle(fontSize: 14.sp),
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
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
      ),
    );
  }
}
