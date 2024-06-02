import 'package:capstone_project_mobile/services/get_service.dart';
import 'package:flutter/material.dart';
import '../model/patient.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage(name: 'ForumPage')

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  late Future<List<Patient>> futurePatients;

  @override
  void initState() {
    super.initState();
    futurePatients = fetchPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futurePatients,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var patients = snapshot.data!;
            return ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(patients[index].email),
                subtitle: Text(patients[index].roles[0].toString()),
                leading: Text(patients[index].id),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
