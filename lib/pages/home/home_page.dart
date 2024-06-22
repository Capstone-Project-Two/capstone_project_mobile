import 'package:capstone_project_mobile/theme/base_app_colors.dart';
import 'package:flutter/material.dart';
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
                gradient: BaseAppColors.primaryGradient,
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
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stress Monitor',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(width: 50),
                            Text(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              'Find out your level of emotions ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(width: 10),
                  Image.asset(
                    'lib/assets/images/stressmonitor.png',
                    width: 70,
                    height: 90,
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
                  color: Colors.grey,
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
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Find Your Activities',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Understand which activity is suitable for your lifestyle',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Image.asset(
                              'lib/assets/images/activity.jpg',
                              width: 300,
                              height: 300,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
