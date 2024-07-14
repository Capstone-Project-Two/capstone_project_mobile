import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/core/model/appointment.dart';
import 'package:capstone_project_mobile/core/model/patient.dart';
import 'package:capstone_project_mobile/core/model/patient_comment_model.dart';
import 'package:capstone_project_mobile/core/model/post.dart';
import 'package:capstone_project_mobile/core/model/therapist.dart';
import 'package:capstone_project_mobile/core/services/http_service.dart';
import 'package:capstone_project_mobile/utils/api_helper.dart';

class GetService {
  static Future<List<Patient>> fetchPatients() async {
    List<Patient> patients = [];
    HttpService httpService = HttpService(path: ApiRoute.patients.name);
    var HttpResponse(:jsonData, :httpRes) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      for (var eachPatient in jsonData['data']) {
        patients.add(Patient.fromJson(eachPatient));
      }
    } else {
      throw jsonData;
    }

    return patients;
  }

  static Future<List<Post>> fetchPosts() async {
    List<Post> posts = [];
    HttpService httpService = HttpService(path: ApiRoute.posts.name);
    var HttpResponse(:jsonData, :httpRes) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      for (var eachPost in jsonData['data']) {
        posts.add(Post.fromJson(eachPost));
      }
    } else {
      throw jsonData;
    }

    return posts;
  }

  static Future<Post> fetchOnePost(String postId) async {
    HttpService httpService =
        HttpService(path: '${ApiRoute.posts.name}/$postId');
    var HttpResponse(:httpRes, :jsonData) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return Post.fromJson(jsonData['data']);
    } else {
      throw jsonData;
    }
  }

  static Future<List<Therapist>> fetchTherapists() async {
    List<Therapist> therapists = [];
    HttpService httpService = HttpService(path: ApiRoute.therapists.name);
    var HttpResponse(:jsonData, :httpRes) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      for (var eachTherapist in jsonData['data']) {
        therapists.add(Therapist.fromJson(eachTherapist));
      }
    } else {
      throw jsonData;
    }

    return therapists;
  }

  static Future<Therapist> fetchOneTherapist(String therapistId) async {
    HttpService httpService =
        HttpService(path: '${ApiRoute.therapists.name}/$therapistId');
    var HttpResponse(:httpRes, :jsonData) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return Therapist.fromJson(jsonData['data']);
    } else {
      throw jsonData;
    }
  }

  static Future<List<ParentComment>> fetchCommentByPost({
    required String postId,
    String? parentId,
  }) async {
    List<ParentComment> patientComments = [];
    HttpService httpService = HttpService(
      path: ApiRoute.patientComments.name,
      query: {
        "post": postId,
        "parent": parentId,
      },
    );
    var HttpResponse(:jsonData, :httpRes) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      for (var eachComment in jsonData['data']) {
        patientComments.add(ParentComment.fromJson(eachComment));
      }
    } else {
      throw jsonData;
    }

    return patientComments;
  }

  static Future<List<Appointment>> fetchAppointments() async {
    List<Appointment> appointments = [];
    HttpService httpService = HttpService(path: ApiRoute.appointments.name);
    var HttpResponse(:jsonData, :httpRes) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      for (var eachAppointment in jsonData['data']) {
        appointments.add(Appointment.fromJson(eachAppointment));
      }
    } else {
      throw jsonData;
    }

    return appointments;
  }

  static Future<Appointment> fetchOneAppointment(String appointmentId) async {
    HttpService httpService =
        HttpService(path: '${ApiRoute.appointments.name}/$appointmentId');
    var HttpResponse(:httpRes, :jsonData) = await httpService.httpGet();

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return Appointment.fromJson(jsonData['data']);
    } else {
      throw jsonData;
    }
  }
}
