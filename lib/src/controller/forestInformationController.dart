import 'package:get/get.dart';
import 'package:hiker/src/api/forestInformationApi.dart';
import 'package:hiker/src/model/ForestInformationModel.dart';

class ForestInformationController extends GetxController{
  late ForestInformationApi forestInformationApi;
  RxList<ForestInformationModel> forestInformation = <ForestInformationModel>[].obs;
  String mountainName = '';

  @override
  void onInit() {
    super.onInit();
    forestInformationApi = ForestInformationApi(mountainName.obs);
    fetchForest(forestInformationApi, forestInformation, mountainName.obs);
  }

  @override
  void forestSearchingDetail(mountainName) {
    this.mountainName = mountainName;
    onInit();
  }

  void fetchForest(ForestInformationApi forestInformationApi, RxList<ForestInformationModel> forestInformation, RxString mountainName) async{
    var result = await forestInformationApi.fetchForestInformation(mountainName);

    if(result != null){
      forestInformation(result);
    }
  }
}