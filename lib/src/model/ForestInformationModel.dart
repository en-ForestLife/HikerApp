import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:xml/xml.dart';
import '../utils/xmlUtils.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForestInformationModel extends GetxController{
  String? mntnnm;
  String? mntnattchimageseq;
  String? mntninfopoflc;
  String? mntnsbttlinfo;
  String? mntninfohght;
  var language = 'ko';
  var result_papago = 'hi';


  ForestInformationModel({
    this.mntnnm,
    this.mntnattchimageseq,
    this.mntninfopoflc,
    this.mntnsbttlinfo,
    this.mntninfohght,
  });

  factory ForestInformationModel.fromXml(XmlElement xml){
    return ForestInformationModel(
      mntnnm : XmlUtils.searchResultForString(xml, 'mntnnm'),
      mntnattchimageseq : XmlUtils.searchResultForString(xml, 'mntnattchimageseq'),
      mntninfopoflc : XmlUtils.searchResultForString(xml, 'mntninfopoflc'),
      mntnsbttlinfo : XmlUtils.searchResultForString(xml, 'mntnsbttlinfo'),
      mntninfohght : XmlUtils.searchResultForString(xml, 'mntninfohght'),
    );
  }

}