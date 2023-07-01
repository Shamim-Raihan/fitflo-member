
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

Widget myTextField(String texttype, {controller, text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          text,
          style: TextStyle(color: AppColors.greycolor, fontSize: 15),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: TextField(
          obscureText: texttype == 'password' ? true : false,
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 10.0,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget remeberMe({value, onChanged}) {
  return Row(
    children: [
      Checkbox(value: value, onChanged: onChanged),
      const Text(
        'Remember me',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget buildAuthButton(String buttonName) {
  return Container(
    height: 40,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 25),
    decoration: BoxDecoration(
      color: AppColors.secondarybluecolor,
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Center(
      child: Text(
        buttonName,
        style: TextStyle(
            color: AppColors.whitecolor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    ),
  );
}
