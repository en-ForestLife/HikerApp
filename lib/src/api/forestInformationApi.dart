
import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:xml/xml.dart';
import '../controller/translateLanguage.dart';
import '../main/mainPage.dart';
import '../model/ForestInformationModel.dart';

class ForestInformationApi {
  late var dio;
  RxString mountainName;

  ForestInformationApi(this.mountainName) {
    dio = Dio(
      BaseOptions(
          baseUrl: "http://openapi.forest.go.kr",
          queryParameters: {
            'serviceKey':
            'WRW8U5mI32TQ7scwZY7OauPpIOPTEz2o5RcdqnpvaCWeow/zFQ3xRp7uciHXufIHRPIDA+e9/JBjfYCyfy4bTg==',
            'mntnNm':'$mountainName',
            'pageNo':'',
          },
      ),
    );
  }

  Future<List<ForestInformationModel>> fetchForestInformation(RxString mountainName) async{
    var response = await dio.get('/openapi/service/trailInfoService/getforeststoryservice');
    final document = XmlDocument.parse(response.data);

    var results = document.findAllElements('item');
    String changed = '';
    print('--------------------------------forest api --------------------------------');
    print(results
        .map<ForestInformationModel>(
            (element) => ForestInformationModel.fromXml(element))
        .toList());
    print('--------------------------------forest api --------------------------------');
    
    if(results.isNotEmpty) {
      return results
          .map<ForestInformationModel>(
              (element) => ForestInformationModel.fromXml(element))
          .toList();
    }else {
      return Future.value([]);
    }


  }
}