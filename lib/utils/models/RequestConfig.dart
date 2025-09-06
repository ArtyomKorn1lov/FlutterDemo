import 'package:flutterdemo/utils/enums/RequestTypes.dart';

class RequestConfig {
  Map<String, dynamic>? data;
  RequestTypes? requestType = RequestTypes.get;

  RequestConfig({this.data, this.requestType});
}