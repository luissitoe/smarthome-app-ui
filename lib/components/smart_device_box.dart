import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:smarthome/util/app_colors.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerStatus;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: powerStatus ? AppColors.primary : AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withValues(alpha: 0.08),
            offset: Offset(0, 0),
            blurRadius: 50
          )
        ],
        border: Border.all(
          color: AppColors.border,
          width: 2
        )
      ),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            height: 50,
            color: powerStatus ? AppColors.white : AppColors.textColor,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Text(
              smartDeviceName,
              style: TextStyle(
                color: powerStatus ? AppColors.white : AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(powerStatus ? "ON" : "OFF",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: powerStatus ? AppColors.white : AppColors.textColor
              ),),
              CupertinoSwitch(
                activeTrackColor: AppColors.white,
                thumbColor: powerStatus ? AppColors.primary : AppColors.white,
                value: powerStatus,
                onChanged: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
