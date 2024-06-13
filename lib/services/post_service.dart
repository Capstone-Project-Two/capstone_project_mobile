import 'package:capstone_project_mobile/constants/api_route_constant.dart';
import 'package:capstone_project_mobile/model/dto/create_appointment.dart';
import 'package:capstone_project_mobile/model/dto/create_post.dart';
import 'package:capstone_project_mobile/services/http_service.dart';
import 'package:capstone_project_mobile/utils/api_helper.dart';

class PostService {
  static Future createAppointment(CreateAppointment body) async {
    HttpService httpService = HttpService(path: ApiRoute.appointments.name);

    var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
      body: {
        'note': body.note,
        'symptoms': body.symptoms,
        'patient': body.patient,
        'therapist': body.therapist,
        'scheduleDate': body.scheduleDate,
      },
    );

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return httpRes;
    } else {
      throw jsonData;
    }
  }

  static Future createPost(CreatePost body) async {
    HttpService httpService = HttpService(path: ApiRoute.posts.name);

    List<String> files = [];

    if (body.postPhotos!.isNotEmpty) {
      for (int i = 0; i < body.postPhotos!.length; i++) {
        files.add(body.postPhotos![i].path);
      }
    }

    if (files.isNotEmpty) {
      var res = await httpService.httpMultiPartRequest(
        body: {
          'body': body.body,
          'patient': body.patient,
        },
        files: files,
      );

      return res;
    }
    var HttpResponse(:httpRes, :jsonData) =
        await httpService.httpMultiPartRequest(
      body: {
        'body': body.body,
        'patient': body.patient,
      },
      files: [],
    );
    if (ApiHelper.isOk(httpRes.statusCode)) {
      return httpRes;
    } else {
      throw jsonData;
    }
  }

  static Future likePost(
      {required String id, required String patientId}) async {
    HttpService httpService = HttpService(path: "like-posts/$id");

    var HttpResponse(:httpRes, :jsonData) = await httpService.httpPatch(
      body: {
        'patient': patientId,
        'post': id,
      },
    );

    if (ApiHelper.isOk(httpRes.statusCode)) {
      return httpRes;
    } else {
      throw jsonData;
    }
  }
}
