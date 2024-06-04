import 'dart:convert';

import 'package:capstone_project_mobile/constants/env_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpMethod {
  static const String getMethod = 'GET';
  static const String postMethod = 'POST';
  static const String patchMethod = 'PATCH';
  static const String deleteMethod = 'DELETE';
}

class HttpResponse {
  final Response httpRes;
  final dynamic jsonData;

  HttpResponse({
    required this.jsonData,
    required this.httpRes,
  });
}

class HttpService {
  final String path;

  HttpService({
    required this.path,
  });

  static const headers = <String, String>{
    'Content-Type': 'application/json',
  };

  get url => Uri.http(baseApiUrl, '/$path');

  Future<HttpResponse> httpGet() async {
    var res = await http.get(url);
    var jsonData = jsonDecode(res.body);

    return HttpResponse(jsonData: jsonData, httpRes: res);
  }

  Future<HttpResponse> httpPost({required dynamic body}) async {
    var res = await http.post(
      url,
      body: body,
      headers: headers,
    );

    var jsonData = jsonDecode(res.body);

    return HttpResponse(jsonData: jsonData, httpRes: res);
  }

  Future<HttpResponse> httpPatch({dynamic body}) async {
    var res = await http.patch(
      url,
      body: body,
      headers: headers,
    );

    var jsonData = jsonDecode(res.body);

    return HttpResponse(jsonData: jsonData, httpRes: res);
  }

  Future<HttpResponse> httpDelete({dynamic body}) async {
    var res = await http.delete(url, body: body, headers: headers);

    var jsonData = jsonDecode(res.body);

    return HttpResponse(
      jsonData: jsonData,
      httpRes: res,
    );
  }

  Future httpMultiPartRequest(
      {required dynamic body, required List<String> files}) async {
    var request = http.MultipartRequest(HttpMethod.postMethod, url);

    if (files.isNotEmpty) {
      for (int i = 0; i < files.length; i++) {
        dynamic uploadedFiles = await http.MultipartFile.fromPath(
          'postPhotos',
          files[i],
        ).catchError((val) {
          return val;
        });
        request.files.add(uploadedFiles);
      }
    }

    body.forEach((key, value) {
      String stringValue = value.toString();
      request.fields[key] = stringValue;
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return response;
    } else {
      return response.statusCode;
    }
  }
}
