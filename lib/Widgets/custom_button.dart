import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
          child: GestureDetector(
            child: Text(
              text,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
