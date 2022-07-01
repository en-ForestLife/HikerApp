
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';
import '../model/forestInformation.dart';

class ForestInformationApi {
  late var dio;

  ForestInformationApi() {
    dio = Dio(
      BaseOptions(
          baseUrl: "http://openapi.forest.go.kr",
          queryParameters: {
            'serviceKey':
            'WRW8U5mI32TQ7scwZY7OauPpIOPTEz2o5RcdqnpvaCWeow/zFQ3xRp7uciHXufIHRPIDA+e9/JBjfYCyfy4bTg=='
          },
      ),
    );
  }

  Future<ForestInformationModel> fetchForestInformation()async{
    var response = await dio.get('/openapi/service/trailInfoService/getforeststoryservice');
    final document = XmlDocument.parse(response.data);
    final results = document.findAllElements('item');
    print(response);
    if(results.isNotEmpty) {
      return ForestInformationModel.fromXml(results.first);
    }else {
      return Future.value(null);
    }
  }
}