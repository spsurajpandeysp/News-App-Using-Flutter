import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/screen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int activeDot = 0; // Keeps track of which dot is active
  Timer? timer;

  @override
  void initState() {


    super.initState();
    // Start the timer for animation

    Timer(
         Duration(seconds: 3),
         () => {
               Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context) => HomeScreen()))
             });

    timer = Timer.periodic(Duration(milliseconds: 200), (Timer t) {
      setState(() {
        activeDot = (activeDot + 1) % 4; // Loop through dots
      });
    });
    
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(width: 200, 'assets/images/newsLogoTrans.png'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.5),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: activeDot == index
                              ? Colors.blue
                              : Colors.grey[300], // Active dot changes color
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
