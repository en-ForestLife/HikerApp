import 'package:get/get.dart';
import 'package:hiker/src/api/NaverDictionayApi.dart';
import '../model/ThumnailModel.dart';

class DictionarySearchController extends GetxController{
  late NaverDictionaryApi naverDictionaryApi;
  RxList<ThumnailModel> thumnailList = <ThumnailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    naverDictionaryApi = NaverDictionaryApi();
  }

  void fetchSearchResult(String? mountainName) async{
    var result = await naverDictionaryApi.fetchSearchApi(mountainName!);

    if(result != null){
      thumnailList(result);
    }
  }
}