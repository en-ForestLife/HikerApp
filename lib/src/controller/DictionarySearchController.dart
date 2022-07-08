import 'package:get/get.dart';
import 'package:hiker/src/api/NaverDictionayApi.dart';
import '../model/ThumnailModel.dart';

class DictionarySearchController extends GetxController{
  var result;
  late NaverDictionaryApi naverDictionaryApi;
  RxList<ThumnailModel> thumnailList = <ThumnailModel>[].obs;
  String mountainName = '가라산';

  @override
  void onInit() {
    super.onInit();
    naverDictionaryApi = NaverDictionaryApi(mountainName.obs);
    fetchSearchResult(mountainName);
  }

  void fetchSearchResult(String mountainName) async{
    result = await naverDictionaryApi.fetchSearchResult(mountainName);

    if(result != null){
      thumnailList(result);
    }
  }
}