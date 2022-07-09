import 'package:xml/xml.dart';

class XmlUtils {
  static String searchResultForString(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : xml.findAllElements(key).map((e) => e.text).first;
  }

  static double searchResultForDouble(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? 0
        : double.parse(xml.findAllElements(key).map((e) => e.text).first);
  }

  static String deleteTag(String targetString){
    return targetString.replaceAll('<BR>', '').replaceAll('&gt', '').replaceAll('&amp;nbsp;', '').replaceAll('&lt;br /;', '').replaceAll('<p>', '').replaceAll('</p>', '').replaceAll('&nbsp;', '').replaceAll('<strong>', '').replaceAll('</strong>', '');
  }
}