import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:xml/xml.dart';
import '../utils/xmlUtils.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForestInformationModel{
  String? crcmrsghtngetcimageseq;
  String? crcmrsghtnginfodscrt;
  String? crcmrsghtnginfoetcdscrt;
  String? hkngpntdscrt;
  String? hndfmsmtnmapimageseq;
  String? hndfmsmtnslctnrson;
  String? mntnattchimageseq;
  String? mntnid;
  String? mntninfodscrt;
  String? mntninfodtlinfocont ;
  String? mntninfohght;
  String? mntninfomangrtlno;
  String? mntninfomapdnldfilenm;
  String? mntninfomngmemnbdnm;
  String? mntninfopoflc;
  String? mntninfotrnspinfoimageseq;
  String? mntnnm;
  String? mntnsbttlinfo;
  String? pbtrninfodscrt;
  String? ptmntrcmmncoursdscrt;
  String? rcmmncoursimageseq;


  ForestInformationModel({
    this.crcmrsghtngetcimageseq,
    this.crcmrsghtnginfodscrt,
    this.crcmrsghtnginfoetcdscrt,
    this.hkngpntdscrt,
    this.hndfmsmtnmapimageseq,
    this.hndfmsmtnslctnrson,
    this.mntnattchimageseq,
    this.mntnid,
    this.mntninfodscrt,
    this.mntninfodtlinfocont ,
    this.mntninfohght,
    this.mntninfomangrtlno,
    this.mntninfomapdnldfilenm,
    this.mntninfomngmemnbdnm,
    this.mntninfopoflc,
    this.mntninfotrnspinfoimageseq,
    this.mntnnm,
    this.mntnsbttlinfo,
    this.pbtrninfodscrt,
    this.ptmntrcmmncoursdscrt,
    this.rcmmncoursimageseq,
  });

  factory ForestInformationModel.fromXml(XmlElement xml){
    return ForestInformationModel(
      crcmrsghtngetcimageseq : XmlUtils.searchResultForString(xml, 'crcmrsghtngetcimageseq'),
      crcmrsghtnginfodscrt : XmlUtils.searchResultForString(xml, 'crcmrsghtnginfodscrt'),
      crcmrsghtnginfoetcdscrt : XmlUtils.searchResultForString(xml, 'crcmrsghtnginfoetcdscrt'),
      hkngpntdscrt : XmlUtils.searchResultForString(xml, 'hkngpntdscrt'),
      hndfmsmtnmapimageseq : XmlUtils.searchResultForString(xml, 'hndfmsmtnmapimageseq'),
      hndfmsmtnslctnrson : XmlUtils.searchResultForString(xml, 'hndfmsmtnslctnrson'),
      mntnattchimageseq : XmlUtils.searchResultForString(xml, 'mntnattchimageseq'),
      mntnid : XmlUtils.searchResultForString(xml, 'mntnid'),
      mntninfodscrt : XmlUtils.searchResultForString(xml, 'mntninfodscrt'),
      mntninfodtlinfocont  : XmlUtils.searchResultForString(xml, 'mntninfodtlinfocont'),
      mntninfohght : XmlUtils.searchResultForString(xml, 'mntninfohght'),
      mntninfomangrtlno : XmlUtils.searchResultForString(xml, 'mntninfomangrtlno'),
      mntninfomapdnldfilenm : XmlUtils.searchResultForString(xml, 'mntninfomapdnldfilenm'),
      mntninfomngmemnbdnm : XmlUtils.searchResultForString(xml, 'mntninfomngmemnbdnm'),
      mntninfopoflc : XmlUtils.searchResultForString(xml, 'mntninfopoflc'),
      mntninfotrnspinfoimageseq : XmlUtils.searchResultForString(xml, 'mntninfotrnspinfoimageseq'),
      mntnnm : XmlUtils.searchResultForString(xml, 'mntnnm'),
      mntnsbttlinfo : XmlUtils.searchResultForString(xml, 'mntnsbttlinfo'),
      pbtrninfodscrt : XmlUtils.searchResultForString(xml, 'pbtrninfodscrt'),
      ptmntrcmmncoursdscrt : XmlUtils.searchResultForString(xml, 'ptmntrcmmncoursdscrt'),
      rcmmncoursimageseq : XmlUtils.searchResultForString(xml, 'rcmmncoursimageseq'),
    );
  }

}