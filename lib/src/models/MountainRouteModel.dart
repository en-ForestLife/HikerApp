//import 'package:covid_statistics/src/utils/data_utils.dart';
import 'package:hiker/src/utils/xmlUtils.dart';
import 'package:xml/xml.dart';

class MountainRouteModel {
  String? mountainName;
  String? mountainInfoURL;
  String? mountainFile;
  String? mountainImg;

  MountainRouteModel({
    this.mountainName,
    this.mountainInfoURL,
    this.mountainFile,
    this.mountainImg,
  });

  factory MountainRouteModel.empty() {
    return MountainRouteModel();
  }
  /*
  산명
  mntnnm
  등산로 URL
  mntninfourl
  등산로 파일 다운
  mntnfile
  등산로 이미지
  mntnimg
  */

  factory MountainRouteModel.fromXml(XmlElement xml) {
    return MountainRouteModel(
        mountainName: XmlUtils.searchResultForString(xml, 'mntnnm'),
        mountainInfoURL: XmlUtils.searchResultForString(xml, 'mntninfourl'),
        mountainFile: XmlUtils.searchResultForString(xml, 'mntnfile'),
        mountainImg: XmlUtils.searchResultForString(xml, 'mntnimg')
    );
  }
}