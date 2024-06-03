import 'dart:convert';

import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/model/dto/create_post.dart';
import 'package:capstone_project_mobile/services/http_service.dart';

Future createPost(CreatePost body) async {
  var HttpResponse(:httpRes, :jsonData) = await httpPost(
    path: ApiRoute.posts.name,
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
