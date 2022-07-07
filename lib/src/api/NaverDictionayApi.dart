import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class NaverDictionaryApi {
  late var dio;

  NaverDictionaryApi() {
    dio = Dio(
      BaseOptions(
        headers: {
          'X-Naver-Client-Id': 'DRcw6CjBMSp8GXiBdVKr',
          'X-Naver-Client-Secret': 'hQoH2b9GnQ',
        },
        baseUrl: "https://openapi.naver.com",
        queryParameters: {
          'query': '가라산',
        },
      ),
    );
  }

  fetchSearchResult() async{
    var response = await dio.get('/v1/search/encyc.xml');
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('thumbnail');
    print('--------------------------------Naver api --------------------------------');
    print(results);
    print('--------------------------------Naver api --------------------------------');
    //if(results.isNotEmpty) {
    //  return results
    //      .map<ForestInformationModel>(
    //          (element) => ForestInformationModel.fromXml(element))
    //      .toList();
    //}else {
    //  return Future.value(null);
    //}

  }
}