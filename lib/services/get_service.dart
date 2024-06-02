import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/model/patient.dart';
import 'package:capstone_project_mobile/model/post.dart';
import 'package:capstone_project_mobile/services/http_service.dart';

Future<List<Patient>> fetchPatients() async {
  List<Patient> patients = [];
  var HttpResponse(:jsonData, :httpRes) =
      await httpGet(path: ApiRoute.patients.name);

  if (httpRes.statusCode == 200) {
    for (var eachPatient in jsonData['data']) {
      patients.add(Patient.fromJson(eachPatient));
    }
  } else {
    throw jsonData;
  }

  return patients;
}

Future<List<Post>> fetchPosts() async {
  List<Post> posts = [];

  var HttpResponse(:jsonData, :httpRes) =
      await httpGet(path: ApiRoute.posts.name);

  if (httpRes.statusCode == 200) {
    for (var eachPost in jsonData['data']) {
      posts.add(Post.fromJson(eachPost));
    }
  } else {
    throw jsonData;
  }

  return posts;
}

Future<Post> fetchOnePost(String postId) async {
  var HttpResponse(:httpRes, :jsonData) =
      await httpGet(path: '${ApiRoute.posts.name}/$postId');

  if (httpRes.statusCode == 200) {
    return Post.fromJson(jsonData['data']);
  } else {
    throw jsonData;
  }
}
