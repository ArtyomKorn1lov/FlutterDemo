import 'package:flutterdemo/utils/api/ApiClient.dart';
import 'package:flutterdemo/utils/api/Mapper.dart';
import 'package:flutterdemo/utils/models/CommonResponse.dart';
import 'package:flutterdemo/utils/models/FormData.dart';
import 'package:flutterdemo/utils/models/MainData.dart';
import 'package:flutterdemo/utils/models/SuccessResponse.dart';

class Endpoints {
  static Future<MainData> getMainData() {
    return ApiClient.getRequest('/api/main/').then((CommonResponse response) {
      return Mapper.convertJsonToMainData(response.data);
    });
  }
  
  static Future<SuccessResponse> sendFeedback(FormData data) {
    Map<String, dynamic> map = Mapper.convertFormDataToJson(data);
    return ApiClient.postRequest('/api/feedback/', map).then((CommonResponse response) {
      return SuccessResponse(message: response.data['message']);
    });
  }
}
