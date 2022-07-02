// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hiker/src/main/main.dart';
import 'package:hiker/src/utility/xmlUtils.dart';
import 'package:xml/xml.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
  test('산 정보', () {
    final document = XmlDocument.parse(bookshelfXml);
    final items = document.findAllElements('item');
    var forestInformation = <ForestInformationModel>[];
    items.forEach((node) {
      forestInformation.add(ForestInformationModel.fromXml(node));
    });
  });
}

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


class XmlUtils {
  static String searchResult(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ""
        : xml.findAllElements(key).map((e) => e.text).first;
  }
}
