class PatientModel {
  String? hos_guid;
  String? hn;
  String? pname;
  String? fname;
  String? lname;
  String? occupation;
  String? citizenship;
  String? birthday;
  String? addrpart;
  String? moopart;
  String? tmbpart;
  String? amppart;
  String? chwpart;
  String? bloodgrp;
  String? hometel;
  String? informaddr;
  String? informname;
  String? informrelation;
  String? marrystatus;
  String? mathername;
  String? nationality;
  String? pttype;
  String? religion;
  String? sex;
  String? hcode;
  String? cid;

  PatientModel({
    this.hos_guid,
    this.hn,
    this.pname,
    this.fname,
    this.lname,
    this.occupation,
    this.citizenship,
    this.birthday,
    this.addrpart,
    this.moopart,
    this.tmbpart,
    this.amppart,
    this.chwpart,
    this.bloodgrp,
    this.hometel,
    this.informaddr,
    this.informname,
    this.informrelation,
    this.marrystatus,
    this.mathername,
    this.nationality,
    this.pttype,
    this.religion,
    this.sex,
    this.hcode,
    this.cid,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    hos_guid = json['hos_guid'] ?? '';
    hn = json['hn'] ?? '';
    pname = json['pname'] ?? '';
    fname = json['fname'] ?? '';
    lname = json['lname'] ?? '';
    occupation = json['occupation'] ?? '';
    citizenship = json['citizenship'] ?? '';
    birthday = json['birthday'] ?? '';
    addrpart = json['addrpart'] ?? '';
    moopart = json['moopart'] ?? '';
    tmbpart = json['tmbpart'] ?? '';
    amppart = json['amppart'] ?? '';
    chwpart = json['chwpart'] ?? '';
    bloodgrp = json['bloodgrp'] ?? '';
    hometel = json['hometel'] ?? '';
    informaddr = json['informaddr'] ?? '';
    informname = json['informname'] ?? '';
    informrelation = json['informrelation'] ?? '';
    marrystatus = json['marrystatus'] ?? '';
    mathername = json['mathername'] ?? '';
    nationality = json['nationality'] ?? '';
    pttype = json['pttype'] ?? '';
    religion = json['religion'] ?? '';
    sex = json['sex'] ?? '';
    hcode = json['hcode'] ?? '';
    cid = json['cid'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hos_guid'] = hos_guid;
    data['hn'] = hn;
     data['pname'] = pname;
    data['fname'] = fname;
    data['lname'] = lname;
    data['occupation'] = occupation;
    data['citizenship'] = citizenship;
    data['birthday'] = birthday;
    data['addrpart'] = addrpart;
    data['moopart'] = moopart;
    data['tmbpart'] = tmbpart;
    data['amppart'] = amppart;
    data['chwpart'] = chwpart;
    data['bloodgrp'] = bloodgrp;
    data['hometel'] = hometel;
    data['informaddr'] = informaddr;
    data['informname'] = informname;
    data['informrelation'] = informrelation;
    data['marrystatus'] = marrystatus;
    data['mathername'] = mathername;
    data['nationality'] = nationality;
    data['pttype'] = pttype;
    data['religion'] = religion;
    data['sex'] = sex;
    data['hcode'] = hcode;
    data['cid'] = cid;
    
    return data;
  }

  void add(PatientModel patientModel) {}
}
