import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/model/therapist.dart';
import 'package:flutter/material.dart';

class DetailTherapistPage extends StatelessWidget {
  const DetailTherapistPage({super.key, this.therapist});

  final Therapist? therapist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Detail Therapist',
        actionsEnabled: false,
      ),
      body: Column(
        children: [
          Text(therapist!.firstName),
        ],
      ),
    );
  }
}
