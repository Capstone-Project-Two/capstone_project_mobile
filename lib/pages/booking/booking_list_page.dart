import 'package:capstone_project_mobile/components/cards/booking_card.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/appointment.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:capstone_project_mobile/shared/empty_screen.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/material.dart';

class BookingListPage extends StatefulWidget {
  const BookingListPage({super.key});

  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  late Future<List<Appointment>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = GetService.fetchAppointments();
  }

  Future handleRefresh() async {
    setState(() {
      futureAppointments = GetService.fetchAppointments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'All Bookings',
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: FutureBuilder(
          future: futureAppointments,
          builder: (context, snapshot) {
            if (snapshot.data!.isEmpty) {
              return const EmptyScreen(
                title: 'You havent book any appointment.',
              );
            }
            if (snapshot.hasData) {
              var appointments = snapshot.data!;
              return ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: BookingCard(
                      appointment: appointments[index],
                    ),
                  );
                },
                padding: const EdgeInsets.all(16),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
