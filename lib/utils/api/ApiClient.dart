import 'package:flutterdemo/utils/enums/RequestTypes.dart';
import 'package:flutterdemo/utils/models/CommonResponse.dart';
import 'package:flutterdemo/utils/models/CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterdemo/utils/models/RequestConfig.dart';

class ApiClientClass {
  late String apiHost;

  ApiClientClass(String? apiHost) {
    this.apiHost = apiHost ?? '/';
  }

  Future<http.Response> _createRequest(String endpoint, RequestConfig config) async {
    Uri url = Uri.http(apiHost, endpoint);

    Map<String, dynamic>? body = config.data;

    switch(config.requestType) {
      case RequestTypes.post:
        return http.post(url, body: body);
      default:
        return http.get(url);
    }
  }

  Future<CommonResponse> _executeRequest(String endpoint, RequestConfig config) async {
    return _createRequest(endpoint, config)
        .then((http.Response response) async {
          if (response.statusCode == 200) {
            return CommonResponse(data: convert.jsonDecode(response.body) as Map<String, dynamic>, status: response.statusCode);
          } else {
            throw CustomException(response.body);
          }
        })
        .catchError((error) {
          throw CustomException(error.message);
        });
  }

  Future<CommonResponse> getRequest(String endpoint) async {
    return _executeRequest(endpoint, RequestConfig(requestType: RequestTypes.get));
  }

  Future<CommonResponse> postRequest(String endpoint, Map<String, dynamic>? data) async {
    return _executeRequest(endpoint, RequestConfig(requestType: RequestTypes.post, data: data));
  }
}

ApiClientClass ApiClient = ApiClientClass(dotenv.env['API_HOST']);