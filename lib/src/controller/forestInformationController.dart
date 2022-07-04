import 'package:get/get.dart';
import 'package:hiker/src/api/forestInformationApi.dart';
import 'package:hiker/src/model/forestInformation.dart';


class ForestInformationController extends GetxController{
  late ForestInformationApi forestInformationApi;
  RxList<ForestInformationModel> forestInformation = <ForestInformationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    forestInformationApi = ForestInformationApi();
    fetchForest();
  }

  void fetchForest() async{
    var result = await forestInformationApi.fetchForestInformation();
    if(result != null){
      forestInformation(result);
    }
  }
}