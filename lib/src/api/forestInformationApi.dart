
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';
import '../model/ForestInformationModel.dart';

class ForestInformationApi {
  late var _dio;

  ForestInformationApi() {
    _dio = Dio(
      BaseOptions(
          baseUrl: "http://openapi.forest.go.kr",
          queryParameters: {
            'serviceKey': 'Mv0qEvEp+e5Ym2p0SACyVuoWTVBnoV//Ax8Kh5RMar1uUKsYvc3L5xheoGJE+Yp2xwgZhFX9vJ2Lc50Ie2Hi3A=='
          },
      ),
    );
  }

  Future<List<ForestInformationModel>> fetchForestInformation()async{

    var response = await _dio.get('/openapi/service/trailInfoService/getforeststoryservice');
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if(results.isNotEmpty) {
      return results
          .map<ForestInformationModel>(
            (element) => ForestInformationModel.fromXml(element))
          .toList();
    }else {
      return Future.value(null);
    }
  }
}