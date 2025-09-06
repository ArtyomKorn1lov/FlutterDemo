import 'package:flutterdemo/utils/models/FormData.dart';
import 'package:flutterdemo/utils/models/MainData.dart';
import 'package:flutterdemo/utils/models/SliderCardModel.dart';

class Mapper {
  static List<SliderCardModel> convertJsonArrayToCardList(List<dynamic>? array) {
    if (array == null || array.isEmpty) {
      return [];
    }
    List<SliderCardModel> list = [];
    for (dynamic item in array) {
      list.add(SliderCardModel(title: item['title'], description: item['description']));
    }
    return list;
  }

  static MainData convertJsonToMainData(Map<String, dynamic> data) {
    return MainData(
      sales: convertJsonArrayToCardList(data['sales']),
      news: convertJsonArrayToCardList(data['news']),
      products: convertJsonArrayToCardList(data['products']),
    );
  }

  static Map<String, dynamic> convertFormDataToJson(FormData model) {
    Map<String, dynamic> map = {};
    map['name'] = model.name;
    map['surname'] = model.surname;
    map['secondname'] = model.secondname;
    map['email'] = model.email;
    map['phone'] = model.phone;
    return map;
  }
}