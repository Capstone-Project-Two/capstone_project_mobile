import 'dart:convert';

import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/model/dto/create_appointment.dart';
import 'package:capstone_project_mobile/model/dto/create_post.dart';
import 'package:capstone_project_mobile/services/http_service.dart';

Future createPost(CreatePost body) async {
  HttpService httpService = HttpService(path: ApiRoute.posts.name);

  var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
    body: jsonEncode({
      'body': body.body,
      'patient': body.patient,
      'postPhotos': body.postPhotos,
    }),
  );

  if (httpRes.statusCode == 201) {
    return httpRes;
  } else {
    throw jsonData;
  }
}

Future createAppointment(CreateAppointment body) async {
  HttpService httpService = HttpService(path: ApiRoute.appointments.name);

  print(body.getNote);

  var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
    body: jsonEncode({
      'note': body.note,
      'symptoms': body.symptoms,
      'patient': body.patient,
      'therapist': body.therapist,
      'scheduleDate': body.scheduleDate,
    }),
  );

  if (httpRes.statusCode == 201) {
    return httpRes;
  } else {
    throw jsonData;
  }
}
