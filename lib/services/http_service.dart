import 'dart:convert';

import 'package:capstone_project_mobile/constants/env_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpResponse {
  final Response httpRes;
  final dynamic jsonData;

  HttpResponse({
    required this.jsonData,
    required this.httpRes,
  });
}

Future<HttpResponse> httpGet({required String path}) async {
  var url = Uri.http(baseApiUrl, '/$path');
  var res = await http.get(url);
  var jsonData = jsonDecode(res.body);

  return HttpResponse(jsonData: jsonData, httpRes: res);
}

Future<HttpResponse> httpPost({required String path, dynamic body}) async {
  var url = Uri.http(baseApiUrl, '/$path');
  var res = await http.post(
    url,
    body: body,
    headers: <String, String>{'Content-Type': 'application/json'},
  );

  var jsonData = jsonDecode(res.body);

  return HttpResponse(jsonData: jsonData, httpRes: res);
}
