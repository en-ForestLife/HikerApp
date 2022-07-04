import 'dart:convert';
import 'package:http/http.dart' as http;

class translateLanguage {

  var language='en';

  Future<void> getLanguage_papago() async {
    String _client_id = "6mZvws_z90LcqP_ZRmTS";
    String _client_secret = "dA465UlQrv";
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

  Future<void> getTranslation_papago() async {
    String _client_id = "6mZvws_z90LcqP_ZRmTS";
    String _client_secret = "dA465UlQrv";
    String _content_type = "application/x-www-form-urlencoded; charset=UTF-8";
    String _url = "https://openapi.naver.com/v1/papago/n2mt";
    //await getLanguage_papago();

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
        'target': "ko", //원하는 언어를 선택할 수 있다.
        'text': "Hello world.",
      },
    );

    if (trans.statusCode == 200) {
      var dataJson = jsonDecode(trans.body);
      var result_papago = dataJson['message']['result']['translatedText'];
      print(result_papago);
    } else {
      print(trans.statusCode);
    }
  }
}
