
import 'package:fitflo_v2_1/screens/start_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExercisesScreen extends StatefulWidget {
  final String title,category,objective;
  const ExercisesScreen({Key? key,required this.title, required this.category,required this.objective}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {

  List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Assault Bike Cardio',
      'primary': 'Quadriceps',
      'sets': '1',
      'reps': '1'
    },
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Assault Bike Cardio',
      'primary': 'Quadriceps',
      'sets': '1',
      'reps': '1'
    },
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Assault Bike Cardio',
      'primary': 'Quadriceps',
      'sets': '1',
      'reps': '1'
    },
    {
      'image': 'assets/images/demo_image.jpg',
      'title': 'Assault Bike Cardio',
      'primary': 'Quadriceps',
      'sets': '1',
      'reps': '1'
    },
  ];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int columnCount = (screenWidth ~/ 200).clamp(1, 4);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,size: 20.sp),
                      Text(
                          'Return',
                        style: TextStyle(
                          fontSize: 16.sp
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          widget.category,
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          'Objective: ${widget.category}',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: (){},
                        child: Text(
                            'Start workout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 10.h,),
                Text(
                    'Exercises',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                    '3 results',
                  style: TextStyle(
                    fontSize: 16.sp
                  ),
                ),
                SizedBox(height: 10.h,),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount,
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.w,
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
                                builder: (_) =>  const StartWorkoutScreen()));
                      },
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
                                child: Image.asset(
                                  item['image'],
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
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    item['primary'],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black54
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Sets: ${item['sets']}',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black54
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Reps: ${item['reps']}',
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
                    );
                  },
                ),
                const SizedBox(height: 16),

              ],
            ),
          ),
        )
      ),
    );
  }
}
