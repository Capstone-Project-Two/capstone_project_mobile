import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// // ignore: unused_import
// import '../../constants/env_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //stress monitor
            Container(
              width: 348,
              height: 150,
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF005EDC), Color(0xFF7908D2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode
                      .clamp, // Optional, defines how the gradient should be repeated
                ),
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //   color: Colors.blueAccent,
                //   width: 2,
                // ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Stress Monitor',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  SizedBox(width: 60), // Space between icon and text
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/11091/11091858.png',
                    width: 60,
                    height: 70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //find activity
            Container(
              width: 348,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
