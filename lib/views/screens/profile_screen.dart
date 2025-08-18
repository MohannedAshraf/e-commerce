// ignore_for_file: avoid_print

import 'package:e_commerce/helper/app_images.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    double getWidth(double wdt) {
      const designWidth = 375;
      return (wdt * screenWidth) / designWidth;
    }

    double getHeight(double hgt) {
      const designHeight = 812;
      return (hgt * screenHeight) / designHeight;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: getHeight(30)),
            SizedBox(
              width: getWidth(150),
              height: getHeight(150),
              child: CircleAvatar(
                backgroundImage: AssetImage(AppImages.myphoto),
                radius: 20,
                backgroundColor: Colors.amberAccent,
              ),
            ),
            SizedBox(height: getHeight(10)),
            const Text(
              "Mohanned Ashraf",
              style: TextStyle(fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getHeight(5)),
            Text(
              "mohannedashraf@gamil.com",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.red[300],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getHeight(30)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[50]),
              onPressed: () {
                print("iam out ");
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
