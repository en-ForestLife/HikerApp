import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class translateLanguage extends GetxController{

  var language = 'ko';
  var result_papago = List<String>.filled(10, '');
  var result_detail = '';
  var title= '';
  var description= '';
  var bus= '';
  var point= '';
  var information= '';


  Future<void> getLanguage_papago() async {
    String _client_id = "SjKAIQrtcmNrweSn7_0L";
    String _client_secret = "b3PLXN2kp5";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/n2mt";

    http.Response lan = await http.post(Uri.parse(_url),
        headers: {
// 'query': text,
          'Content-Type': _content_type,
          'X-Naver-Client-Id': _client_id,
          'X-Naver-Client-Secret': _client_secret
        },
        body: {
          'query':
          'The complete developer platform to build, scale, and deliver secure software.'
        });
    if (lan.statusCode == 200) {
      var dataJson = jsonDecode(lan.body);
//만약 성공적으로 언어를 받아왔다면 language 변수에 언어가 저장됩니다. (ex: eu, ko, etc..)
      language = dataJson['langCode'];
      print(language);
    } else {
      print(lan.statusCode);
    }
  }

  Future<void> getTranslation_papago(var information, int index) async {
    String _client_id = "SjKAIQrtcmNrweSn7_0L";
    String _client_secret = "b3PLXN2kp5";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/n2mt";
    //await getLanguage_papago();
    String mntnnm = information.mntnnm;
    String mntnsbttlinfo = information.mntnsbttlinfo;
    String mntninfopoflc = information.mntninfopoflc;

    http.Response trans = await http.post(
      Uri.parse(_url),
      headers: {
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        'Content-Type': _content_type,
        'X-Naver-Client-Id': _client_id,
        'X-Naver-Client-Secret': _client_secret
      },
      body: {
        'source': language, //위에서 언어 판별 함수에서 사용한 language 변수
        'target': "en", //원하는 언어를 선택할 수 있다.
        'text': '$mntnnm♡$mntnsbttlinfo♡$mntninfopoflc',

        // '''경기 제 1봉인 화악산(1,468m)에서 동남쪽으로 뻗어 내린 능선상에 솟아 있는 가덕산은 몽덕산과 북배산의 능선 중간에 자리잡고 있다. 억새산이라고 할만큼 가을철에 억새가 볼만하다.&amp;lt;br /&amp;gt;&#xD;
        //수백평의 억새밭인 가덕산 정상에 오르면 서북방향으로 화악산이 보이고, 남쪽으로는 목동평야와 북배산, 계관산 너머로 삼악산으로 이어지는 능선이 한눈에 들어 온다. 동쪽으로는 의암호와 춘천호, 그리고 호반의 도시, 춘천시가 보인다.&amp;lt;br /&amp;gt;&#xD;
        // 가덕산은 계관산, 북배산, 몽덕산과 더불어 네 개의 산을 연결하여 등산하는 유명한 종주코스이다. 이 능선에 구축된 등산길은 넓게 길이 잘 뚫려 있고 굴곡이 심하지 않아 겨울철 능선 종주산행지로 적격이다.''',
      },
    );
    //print(information[0].mntnnm.length);
    if (trans.statusCode == 200) {
      print(index);
      print('---------------------------------------');
      var dataJson = jsonDecode(trans.body);
      result_papago[index] = dataJson['message']['result']['translatedText'];
      update();
    } else {
      print(trans.statusCode);
    }
  }






  Future<void> Translation_papago(var changeLanguage, int index) async {
    String _client_id = "IcZhZqxeAyF8rEBuNHpB";
    String _client_secret = "8CeYkndl4V";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/n2mt";

    http.Response trans = await http.post(
      Uri.parse(_url),
      headers: {
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        'Content-Type': _content_type,
        'X-Naver-Client-Id': _client_id,
        'X-Naver-Client-Secret': _client_secret
      },
      body: {
        'source': language, //위에서 언어 판별 함수에서 사용한 language 변수
        'target': "en", //원하는 언어를 선택할 수 있다.
        'text': changeLanguage,

      },
    );
    if (trans.statusCode == 200) {
      var dataJson = jsonDecode(trans.body);
      result_detail = dataJson['message']['result']['translatedText'];

      switch(index){
        case 0 :
          title = result_detail;
          break;
        case 1 :
          description = result_detail;
          break;
        case 2 :
          bus = result_detail;
          break;
        case 3 :
          point = result_detail;
          break;
        case 4 :
          information = result_detail;
          break;
      }

      print(result_detail);
      update();
    } else {
      print(trans.statusCode);
    }
  }

}