class Ovst_model {
  String? hos_guid;
  String? hn;
  String? vn;
  String? ptname;
  String? vsttime;
  String? hospmain;
  String? pttype_name;
  String? pttypeno;
  String? pdx;
  String? pdx_name;
  String? income;
  String? cc;
  String? spclty;
  String? spclty_name;
  String? ovstist_name;
  String? department_name;
  String? ost_name;
  String? hospital_department_name;
  String? register_department_name;
  String? main_department_name;
  String? pt_walk_name;
  String? pttype;
  String? oqueue;
  String? visit_type_name;
  String? staff_name;
  String? cid;
  String? auth_code;
  String? bps;
  String? bpd;
  String? temperature;
  String? bw;
  String? bmi;

  Ovst_model({
    this.hos_guid,
    this.hn,
    this.vn,
    this.ptname,
    this.vsttime,
    this.hospmain,
    this.pttype_name,
    this.pttypeno,
    this.pdx,
    this.pdx_name,
    this.income,
    this.cc,
    this.spclty,
    this.spclty_name,
    this.ovstist_name,
    this.department_name,
    this.ost_name,
    this.hospital_department_name,
    this.register_department_name,
    this.main_department_name,
    this.pt_walk_name,
    this.pttype,
    this.oqueue,
    this.visit_type_name,
    this.staff_name,
    this.cid,
    this.auth_code,
    this.bps,
    this.bpd,
    this.temperature,
    this.bw,
    this.bmi,
  });

  Ovst_model.fromJson(Map<String, dynamic> json) {
    hos_guid = json['hos_guid'] ?? '';
    hn = json['hn'] ?? '';
    vn = json['vn'] ?? '';
    ptname = json['ptname'] ?? '';
    vsttime = json['vsttime'] ?? '';
    hospmain = json['hospmain'] ?? '';
    pttype_name = json['pttype_name'] ?? '';
    pttypeno = json['pttypeno'] ?? '';
    pdx = json['pdx'] ?? '';
    pdx_name = json['pdx_name'] ?? '';
    income = json['income'] ?? '';
    cc = json['cc'] ?? '';
    spclty = json['spclty'] ?? '';
    spclty_name = json['spclty_name'] ?? '';
    ovstist_name = json['ovstist_name'] ?? '';
    department_name = json['department_name'] ?? '';
    ost_name = json['ost_name'] ?? '';
    hospital_department_name = json['hospital_department_name'] ?? '';
    register_department_name = json['register_department_name'] ?? '';
    main_department_name = json['main_department_name'] ?? '';
    pt_walk_name = json['pt_walk_name'] ?? '';
    pttype = json['pttype'] ?? '';
    oqueue = json['oqueue'] ?? '';
    visit_type_name = json['visit_type_name'] ?? '';
    staff_name = json['staff_name'] ?? '';
    cid = json['cid'] ?? '';
    auth_code = json['auth_code'] ?? '';
    bps = json['bps'] ?? '';
    bpd = json['bpd'] ?? '';
    temperature = json['temperature'] ?? '';
    bw = json['bw'] ?? '';
    bmi = json['bmi'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hos_guid'] = hos_guid;
    data['hn'] = hn;
    data['vn'] = vn;
    data['ptname'] = ptname;
    data['vsttime'] = vsttime;
    data['hospmain'] = hospmain;
    data['pttype_name'] = pttype_name;
    data['pttypeno'] = pttypeno;
    data['pdx'] = pdx;
    data['pdx_name'] = pdx_name;
    data['income'] = income;
    data['cc'] = cc;
    data['spclty'] = spclty;
    data['spclty_name'] = spclty_name;
    data['ovstist_name'] = ovstist_name;
    data['department_name'] = department_name;
    data['ost_name'] = ost_name;
    data['hospital_department_name'] = hospital_department_name;
    data['register_department_name'] = register_department_name;
    data['main_department_name'] = main_department_name;
    data['pt_walk_name'] = pt_walk_name;
    data['pttype'] = pttype;
    data['oqueue'] = oqueue;
    data['visit_type_name'] = visit_type_name;
    data['staff_name'] = staff_name;
    data['cid'] = cid;

    data['auth_code'] = auth_code;
    data['bps'] = bps;
    data['bpd'] = bpd;
    data['temperature'] = temperature;
    data['bw'] = bw;
    data['bmi'] = bmi;

    return data;
  }

  void add(Ovst_model ovstModel) {}
}
