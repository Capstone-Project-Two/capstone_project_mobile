class PatchService {
  // static Future createAppointment(CreateAppointment body) async {
  //   HttpService httpService = HttpService(path: ApiRoute.appointments.name);

  //   var HttpResponse(:httpRes, :jsonData) = await httpService.httpPost(
  //     body: {
  //       'note': body.note,
  //       'symptoms': body.symptoms,
  //       'patient': body.patient,
  //       'therapist': body.therapist,
  //       'scheduleDate': body.scheduleDate,
  //     },
  //   );

  //   if (ApiHelper.isOk(httpRes.statusCode)) {
  //     return httpRes;
  //   } else {
  //     throw jsonData;
  //   }
  // }
}
