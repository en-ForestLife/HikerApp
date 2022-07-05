import 'package:get/get.dart';
import 'package:hiker/src/api/forestInformationApi.dart';
import 'package:hiker/src/main/mainPage.dart';
import 'package:hiker/src/model/forestInformation.dart';

class ForestInformationController extends GetxController{
  late ForestInformationApi forestInformationApi;
  RxList<ForestInformationModel> forestInformation = <ForestInformationModel>[].obs;

  String mountainName = '';

  @override
  void onInit() {
    super.onInit();
    print('oninit');
    forestInformationApi = ForestInformationApi(mountainName.obs);
    fetchForest(forestInformationApi, forestInformation);
  }

  void forestSearchingDetail(mountainName) {
    this.mountainName = mountainName;
    forestInformationApi = ForestInformationApi(this.mountainName.obs);
    fetchForest(forestInformationApi, forestInformation);
    print(this.mountainName);

    //Get.put(ForestInformationController(searchedName));
    //Get.put(ForestInformationController(str));
  }

  void fetchForest(ForestInformationApi forestInformationApi, RxList<ForestInformationModel> forestInformation) async{
    var result = await forestInformationApi.fetchForestInformation();
    if(result != null){
      forestInformation(result);
    }
  }
}