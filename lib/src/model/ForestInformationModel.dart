import 'package:xml/xml.dart';
import '../utils/xmlUtils.dart';

class ForestInformationModel {
  String? mntnnm;
  String? mntnattchimageseq;
  String? mntninfopoflc;
  String? mntnsbttlinfo;
  String? mntninfohght;
  String? mntimage;

  ForestInformationModel({
    this.mntnnm,
    this.mntnattchimageseq,
    this.mntninfopoflc,
    this.mntnsbttlinfo,
    this.mntninfohght,
    this.mntimage,
  });

  factory ForestInformationModel.fromXml(XmlElement xml) {
    return ForestInformationModel(
      mntnnm : XmlUtils.searchResultForString(xml, 'mntnnm'),
      mntnattchimageseq : XmlUtils.searchResultForString(xml, 'mntnattchimageseq'),
      mntninfopoflc : XmlUtils.searchResultForString(xml, 'mntninfopoflc'),
      mntnsbttlinfo : XmlUtils.searchResultForString(xml, 'mntnsbttlinfo'),
      mntninfohght : XmlUtils.searchResultForString(xml, 'mntninfohght'),
      mntimage : XmlUtils.searchResultForString(xml, 'thumbnail'),
    );
  }
}