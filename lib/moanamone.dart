import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:moanamtang/models/ovst_model.dart';
import 'package:moanamtang/models/patient_model.dart';
import 'package:moanamtang/utility/my_constant.dart';
import 'package:moanamtang/widgets/show_title.dart';
import 'package:google_fonts/google_fonts.dart';

class MoanamonePage extends StatefulWidget {
  const MoanamonePage({super.key});

  @override
  State<MoanamonePage> createState() => _MoanamonePageState();
}

class _MoanamonePageState extends State<MoanamonePage> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  int index = 0;
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  List<PatientModel> patientModel = [];
  List<Ovst_model> ovstModel = [];
  
  String? hn, fnamenew, lname;

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  late String barcodeScanRes = '';

  @override
  void initState() {
    super.initState();
    // scanQR();
  }

  Future<void> scanQR() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);
      // print('## value for API ===> $barcodeScanRes');
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
      getdata();
    });
  }

  Future<Null> getdata() async {
     print('### ==>>>_scanBarcode==========>>>> $_scanBarcode');
    // if (patientModel.isNotEmpty) {
    //   patientModel.clear();
    // } else {}
    final response =
        // '${MyConstant.domain}/moanamtang/api/getopenvisit.php?isAdd=true&hn=$_scanBarcode'; //hn
         '${MyConstant.domain}/moanamtang/api/getopenvisit.php?isAdd=true&vn=$_scanBarcode';
    await Dio().get(response).then((value) async {
      print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        Ovst_model model = Ovst_model.fromJson(item);
        var hn = model.hn!.toString();
        var vn = model.vn!.toString();
        var ptname = model.ptname!.toString();
        var cc = model.cc!.toString();
        var spclty_name = model.spclty_name!.toString();
        var ovstist_name = model.ovstist_name!.toString();
        var hospital_department_name = model.hospital_department_name!.toString();
        var main_department_name = model.main_department_name!.toString();
        print('### ==>>>hn==========>>>> $hn');
        print('### ==>>>vn==========>>>> $vn');
        print('### ==>>>ptname==========>>>> $ptname');
        print('### ==>>>cc==========>>>> $cc');
        print('### ==>>>spclty_name==========>>>> $spclty_name');
        print('### ==>>>ovstist_name==========>>>> $ovstist_name');
        print('### ==>>>hospital_department_name==========>>>> $hospital_department_name');
        print('### ==>>>main_department_name==========>>>> $main_department_name');
        setState(() {
          ovstModel.add(model); 
          ptname = ptname; 
        });
        // print('### ==>>>==========>>>> $fnamenew'); 
      }
      // if (response.statusCode == 200) { 
      //   return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      // } else { 
      //   throw Exception('Failed to load album');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 214, 247),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                // buildImage(size),
                //  builAppname(),
                buildImagePK(),
                builAppname(),
                // buildUser(size),
                // buildPassword(size),
                // buildSubmit(size),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MaterialButton(
                        onPressed: () {
                          scanQR();
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 238, 255, 252),
                              radius: 60,
                              child: Icon(
                                Icons.qr_code_rounded,
                                color: Colors.orange,
                                size: 80,
                              ),
                            ),
                            Text(
                              'Scan ',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 47, 183, 201),
                              ),
                            )
                          ],

                          //                   fontSize: 30,
                          // color: Color.fromARGB(255, 27, 207, 180),
                          // fontWeight: FontWeight.bold);
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildImagePK() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 290,
          decoration: const BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("images/logomoa.png"), fit: BoxFit.cover),
          ),
          margin: const EdgeInsets.only(top: 85),
          // width: size * 0.3,
          // child: ShowImage(path: MyConstant.img_logo),
        ),
      ],
    );
  }
}

Row builAppname() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        // margin: const EdgeInsets.only(top: 90,right: 3,left: 175),
        margin: const EdgeInsets.only(top: 2),
        child: Text(
          'หมอนำทาง',
          style: GoogleFonts.sarabun(
            // textStyle: Theme.of(context).textTheme.displayLarge,
            textStyle: TextStyle(
                color: Color.fromARGB(255, 47, 183, 201), letterSpacing: .5),
            fontSize: 55,
            fontWeight: FontWeight.w700,
            // fontStyle: FontStyle.italic,
          ),
        ),
        // child: ShowTitle(
        // title: MyConstant.appfirstName,
        // textStyle: MyConstant().appfirststyle(),
        // title: Text('หมอนำทาง',style: GoogleFonts.lato(),),
        // ),
      ),
    ],
  );
}

Row buildSubmit(double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: size * 0.5,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton.icon(
            icon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.qr_code_rounded,
                color: Color.fromARGB(255, 2, 143, 124),
                size: 40.0,
              ),
            ),
            label: Text(
              'Scan',
              style: MyConstant().Scanqrcodevn(),
            ),
            onPressed: () {
              // scanQR();
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Color.fromARGB(255, 238, 255, 252)),
          ),
        ),
      ),
    ],
  );
}
