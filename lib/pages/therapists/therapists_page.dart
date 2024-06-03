import 'package:capstone_project_mobile/components/cards/therapist_card.dart';
import 'package:capstone_project_mobile/model/therapist.dart';
import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';

class TherapistsPage extends StatefulWidget {
  const TherapistsPage({super.key});

  @override
  State<TherapistsPage> createState() => _TherapistsPageState();
}

class _TherapistsPageState extends State<TherapistsPage> {
  late Future<List<Therapist>> futureTherapists;

  @override
  void initState() {
    super.initState();
    futureTherapists = fetchTherapists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: futureTherapists,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var therapists = snapshot.data!;
              return ListView.builder(
                itemCount: therapists.length,
                itemBuilder: (context, index) => TherapistCard(
                    firstName: therapists[index].firstName,
                    lastName: therapists[index].lastName,
                    specializations: therapists[index].specializations),
                padding: const EdgeInsets.only(bottom: 16),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}