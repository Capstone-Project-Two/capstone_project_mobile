import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/model/dto/create_post.dart';
import 'package:capstone_project_mobile/services/http_service.dart';
import 'package:flutter/material.dart';

Future createPost(CreatePost body) async {
  HttpService httpService = HttpService(path: ApiRoute.posts.name);

  List<String> files = [];

  if (body.postPhotos!.isNotEmpty) {
    for (int i = 0; i < body.postPhotos!.length; i++) {
      files.add(body.postPhotos![i].path);
    }
  }

  if (body.body.isEmpty && body.postPhotos!.isEmpty) {
    throw ErrorDescription('Please fill sth');
  }

  var res = await httpService.httpMultiPartRequest(
    body: {
      'body': body.body,
      'patient': body.patient,
    },
    files: files,
  );

  return res;
}
