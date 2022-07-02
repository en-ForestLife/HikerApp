import 'package:xml/xml.dart';
import '../utility/xmlUtils.dart';

class ForestInformationModel {
  String? mntnnm;
  String? mntnattchimageseq;
  String? mntninfopoflc;
  String? mntnsbttlinfo;
  String? mntninfohght;

  ForestInformationModel({
    this.mntnnm,
    this.mntnattchimageseq,
    this.mntninfopoflc,
    this.mntnsbttlinfo,
    this.mntninfohght,
  });

  factory ForestInformationModel.fromXml(XmlElement xml) {
    return ForestInformationModel(
      mntnnm : XmlUtils.searchResult(xml, 'mntnnm'),
      mntnattchimageseq : XmlUtils.searchResult(xml, 'mntnattchimageseq'),
      mntninfopoflc : XmlUtils.searchResult(xml, 'mntninfopoflc'),
      mntnsbttlinfo : XmlUtils.searchResult(xml, 'mntnsbttlinfo'),
      mntninfohght : XmlUtils.searchResult(xml, 'mntninfohght'),
    );
  }
}