import 'package:capstone_project_mobile/components/cards/booking_card.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/providers/appointment_provider.dart';
import 'package:capstone_project_mobile/shared/error_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingListPage extends StatefulWidget {
  const BookingListPage({super.key});

  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'All Bookings',
      ),
      body: Consumer<AppointmentProvider>(
        builder: (context, appointmentProvider, child) {
          return RefreshIndicator(
            onRefresh: appointmentProvider.handleGetAllAppointments,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: appointmentProvider.handleGetAllAppointments(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var appointments = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                appointmentProvider.getAllAppointments.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: BookingCard(
                                  appointment: appointments[index],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: ErrorScreen(
                              onTryAgain: () async {
                                await appointmentProvider
                                    .handleGetAllAppointments();
                              },
                              errorObject: snapshot.error,
                            ),
                          );
                        }
                        return const LoadingScreen();
                      },
                    ),
                    if (appointmentProvider.getAllAppointments.length < 3) ...[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
