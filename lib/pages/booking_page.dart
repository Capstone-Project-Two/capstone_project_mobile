import 'package:capstone_project_mobile/components/cards/therapist_card.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/therapist.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.therapist});
  final Therapist therapist;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Book Appointment'),
      body: Column(
        children: [
          Text('Apppointment with', style: TextStyle(
            
          ),),
          TherapistCard(
            therapist: widget.therapist,
          )
        ],
      ),
    );
  }
}
