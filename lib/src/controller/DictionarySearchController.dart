import 'package:get/get.dart';
import 'package:hiker/src/api/NaverDictionayApi.dart';
import 'package:hiker/src/api/forestInformationApi.dart';
import 'package:hiker/src/model/ForestInformationModel.dart';

class DictionarySearchController extends GetxController{
  late NaverDictionaryApi naverDictionaryApi;

  @override
  void onInit() {
    super.onInit();
    naverDictionaryApi = NaverDictionaryApi();
    fetchSearchResult();
  }

  void fetchSearchResult() {
    naverDictionaryApi.fetchSearchResult();
  }
}