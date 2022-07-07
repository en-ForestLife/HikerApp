import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:xml/xml.dart';
import '../model/ThumnailModel.dart';

class NaverDictionaryApi {
  late var dio;
  RxString mountainName;

  NaverDictionaryApi(this.mountainName) {
    dio = Dio(
      BaseOptions(
        headers: {
          'X-Naver-Client-Id': 'DRcw6CjBMSp8GXiBdVKr',
          'X-Naver-Client-Secret': 'hQoH2b9GnQ',
        },
        baseUrl: "https://openapi.naver.com",
        queryParameters: {
          'query':'$mountainName',
        },
      ),
    );
  }

  Future<List<ThumnailModel>> fetchSearchResult(String mountainName) async{
    var response = await dio.get('/v1/search/encyc.xml');
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    print('--------------------------------Naver api --------------------------------');
    print(results);
    print('--------------------------------Naver api --------------------------------');
    if(results.isNotEmpty) {
      return results
          .map<ThumnailModel>(
              (element) => ThumnailModel.fromXml(element))
          .toList();
    }else {
      return Future.value(null);
    }

  }
}