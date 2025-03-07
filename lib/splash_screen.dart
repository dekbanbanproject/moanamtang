import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moanamtang/moanamone.dart';
import 'package:moanamtang/screens/patient/visitpatient.dart';

import 'package:moanamtang/states/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('images/Animation - 1714493864150.json'),
          ),
        ],
      ),
      nextScreen: const MoanamonePage(),
      duration: 3000,
      backgroundColor: Colors.white,
      splashIconSize: 300,
    );
  }
}
