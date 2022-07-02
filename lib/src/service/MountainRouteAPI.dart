import 'package:hiker/src/models/mountainRouteModel.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class RouteAPI{
  late var _dio;
  RouteAPI() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://openapi.forest.go.kr",
        queryParameters: {'serviceKey': 'Mv0qEvEp%2Be5Ym2p0SACyVuoWTVBnoV%2F%2FAx8Kh5RMar1uUKsYvc3L5xheoGJE%2BYp2xwgZhFX9vJ2Lc50Ie2Hi3A%3D%3D'},
      ),
    );
  }

  Future<List<MountainRouteModel>> fetchRouteInfo(
      {String? mountainName, String? mountainImg}) async {
    var query = Map<String, String>();
    if (mountainName != null) query.putIfAbsent('mountainName', () => mountainName);
    if (mountainImg != null) query.putIfAbsent('mountainImg', () => mountainImg);
    var response = await _dio.get(
        '/openapi/service/trailInfoService/getforestspatialdataservice',
        queryParameters: query);
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return results
          .map<MountainRouteModel>(
              (element) => MountainRouteModel.fromXml(element))
          .toList();
    } else {
      return Future.value(null);
    }
  }
}
