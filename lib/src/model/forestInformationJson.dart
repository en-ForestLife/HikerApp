class ForestInformationJsonModel {
  String? mntnnm;
  String? mntnattchimageseq;
  String? mntninfopoflc;
  String? mntnsbttlinfo;
  String? mntninfohght;

  ForestInformationJsonModel({
    this.mntnnm,
    this.mntnattchimageseq,
    this.mntninfopoflc,
    this.mntnsbttlinfo,
    this.mntninfohght,
  });

  ForestInformationJsonModel.fromJson(Map<String, dynamic> json) {
    mntnnm = json['mntnnm'];
    mntnattchimageseq = json['mntnattchimageseq'];
    mntninfopoflc = json['mntninfopoflc'];
    mntnsbttlinfo = json['mntnsbttlinfo'];
    mntninfohght = json['mntninfohght'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mntnnm'] = this.mntnnm;
    data['mntnattchimageseq'] = this.mntnattchimageseq;
    data['mntninfopoflc'] = this.mntninfopoflc;
    data['mntnsbttlinfo'] = this.mntnsbttlinfo;
    data['mntninfohght'] = this.mntninfohght;

    return data;
  }
}