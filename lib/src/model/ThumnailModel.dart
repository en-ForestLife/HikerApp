import 'package:xml/xml.dart';
import '../utils/xmlUtils.dart';

class ThumnailModel {
  String? thumbnail;

  ThumnailModel({
    this.thumbnail,
  });

  factory ThumnailModel.fromXml(XmlElement xml) {
    return ThumnailModel(
      thumbnail : XmlUtils.searchResultForString(xml, 'thumbnail'),
    );
  }
}