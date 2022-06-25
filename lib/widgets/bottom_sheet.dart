import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuiltBottomSheet extends StatelessWidget {
  String label;
  Function() onTap;
  Color clr;
  bool? isClose = false;
  BuiltBottomSheet({
    Key? key,
    required this.label,
    required this.onTap,
    required this.clr,
    this.isClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 45,
        width: 320, //SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: clr,
          ),
          borderRadius: BorderRadius.circular(10),
          color: clr,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
