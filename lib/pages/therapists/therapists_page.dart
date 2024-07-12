import 'package:capstone_project_mobile/components/cards/therapist_card.dart';
import 'package:capstone_project_mobile/core/controller/therapist_controller.dart';
import 'package:capstone_project_mobile/pages/booking/booking_list_page.dart';
import 'package:capstone_project_mobile/shared/error_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TherapistsPage extends StatefulWidget {
  const TherapistsPage({super.key});

  @override
  State<TherapistsPage> createState() => _TherapistsPageState();
}

class _TherapistsPageState extends State<TherapistsPage> {
  final TherapistController therapistController =
      Get.put(TherapistController());

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
        body: RefreshIndicator(
      onRefresh: therapistController.handleGetAllTherapists,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(16)),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                      backgroundColor:
                          MaterialStatePropertyAll(colorScheme.primary)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingListPage()));
                  },
                  child: Text(
                    'View All Bookings',
                    style: TextStyle(
                        color: colorScheme.inversePrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 16),
              FutureBuilder(
                future: therapistController.handleGetAllTherapists(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var therapists = snapshot.data!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: therapistController.getAllTherapists.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TherapistCard(
                            therapist: therapists[index],
                            isNavigate: true,
                          ),
                        );
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ErrorScreen(
                        onTryAgain: () async {
                          await therapistController.handleGetAllTherapists();
                        },
                        errorObject: snapshot.error,
                      ),
                    );
                  }
                  return const LoadingScreen();
                },
              ),
              if (therapistController.getAllTherapists.length < 3) ...[
                SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              ]
            ],
          ),
        ),
      ),
    ));
  }
}
