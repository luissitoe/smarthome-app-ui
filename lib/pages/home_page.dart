import 'package:flutter/material.dart';
import 'package:smarthome/components/smart_device_box.dart';
import 'package:smarthome/util/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List smartDevices = [
    // [ name, iconPath, powerStatus ]
    ['Smart Light', "assets/icons/light-bulb.png", false],
    ['Smart AC', "assets/icons/air-conditioner.png", false],
    ['Smart TV', "assets/icons/smart-tv.png", false],
    ['Smart Fan', "assets/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // custom app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    "assets/icons/menu.png",
                    height: 35,
                    color: AppColors.textColor,
                  ),

                  // account
                  ClipOval(
                    child: Image.asset(
                      "assets/icons/profile.jpg",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // welcome message
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Home,", style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.w500)),
                      Text(
                        "Camila Mendes",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset("assets/icons/smart-home.png",
                    height: 55,),
                ],
              ),
              SizedBox(height: 30,),
              Divider(
                height: 2,
                color: AppColors.border,
                thickness: 2,
              ),
              SizedBox(height: 50),
              Text(
                "Smart Devices",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: smartDevices.length,
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: smartDevices[index][0],
                      iconPath: smartDevices[index][1],
                      powerStatus: smartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  },
                ),
              ),
              //smart devices grid
            ],
          ),
        ),
      ),
    );
  }
}
