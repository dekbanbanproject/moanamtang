import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:moanamtang/models/article_model_check.dart';
import 'package:moanamtang/screens/admin/cctv/maincctvreq.dart';
import 'package:moanamtang/utility/my_constant.dart';
import 'package:moanamtang/utility/my_dialog.dart';

class Maincctvedit extends StatefulWidget {
  final ArticleCheckModel articlecheckModeledit;
  const Maincctvedit({super.key, required this.articlecheckModeledit});

  @override
  State<Maincctvedit> createState() => _MaincctveditState();
}

class _MaincctveditState extends State<Maincctvedit> {
  Future<void> _refreshpage() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  final formKey = GlobalKey<FormState>();
  late ArticleCheckModel _articlecheckModeledit;

  String? cctv_check_id, screen, conner, drawback, camerasave, powerbackup;
  @override
  void initState() {
    super.initState();
    _articlecheckModeledit = widget.articlecheckModeledit;
    cctv_check_id = _articlecheckModeledit.cctv_check_id;
    screen = _articlecheckModeledit.cctv_camera_screen;
    conner = _articlecheckModeledit.cctv_camera_corner;
    drawback = _articlecheckModeledit.cctv_camera_drawback;
    camerasave = _articlecheckModeledit.cctv_camera_save;
    powerbackup = _articlecheckModeledit.cctv_camera_power_backup;
    print('## drawback ## ==>>>$drawback');
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Center(
            child: Text(
              'รายละเอียด',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _refreshpage,
        color: Colors.deepPurple, height: 300,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 2,
        showChildOpacityTransition: true,
        child: ListView(
          // child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          left: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          right: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(221, 255, 255, 255)
                                .withOpacity(0.05),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: const Offset(0, 1),
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: const Text(
                            'จอกล้อง',
                            style: TextStyle(fontSize: 17),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              damagedRadio(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          left: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          right: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(221, 255, 255, 255)
                                .withOpacity(0.05),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: const Offset(0, 1),
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: const Text(
                            'มุมกล้อง',
                            style: TextStyle(fontSize: 17),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              damagedconerRadio(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          left: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          right: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(221, 255, 255, 255)
                                .withOpacity(0.05),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: const Offset(0, 1),
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: const Text(
                            'สิ่งกีดขวาง',
                            style: TextStyle(fontSize: 17),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              damageddrawbackRadio(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          left: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          right: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(221, 255, 255, 255)
                                .withOpacity(0.05),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: const Offset(0, 1),
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: const Text(
                            'การบันทึก',
                            style: TextStyle(fontSize: 17),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              damagedsaveRadio(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          left: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          right: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 102, 217, 252)),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(221, 255, 255, 255)
                                .withOpacity(0.05),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: const Offset(0, 1),
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: const Text(
                            'การสำรองไฟ',
                            style: TextStyle(fontSize: 17),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              damagedpowerRadio(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            saveButtom(size),
          ],
        ),
        //  onRefresh: onRefresh
      ),
    );
  }

  Row saveButtom(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size * 0.5,
          child: ElevatedButton(
            style: MyConstant().mybuttonStyle(),
            // onPressed: () {
            //   print('######## Active = $cctvStatus, ###### Article num = $articlenum');
            // },
            onPressed: () => comfirmDialog(),
            // onPressed: () => editActive(),
            child: Text(
              'Update',
              style: MyConstant().h2White(),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> comfirmDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('ต้องการแก้ไขข้อมูลใช่ไหม ?'),
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                updateActive();
                // editActive();
              },
              child: const Text('ใช่'),
            ),
          )
        ],
      ),
    );
  }

  Widget normalRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'จอกล้อง',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );

  Widget damagedRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              activeColor: Colors.blue,
              value: '0',
              groupValue: screen,
              onChanged: (value) {
                setState(() {
                  screen = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              activeColor: Colors.pink,
              value: '1',
              groupValue: screen,
              onChanged: (value) {
                setState(() {
                  screen = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normalconerRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'มุมกล้อง',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damagedconerRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              activeColor: Colors.blue,
              value: '0',
              groupValue: conner,
              onChanged: (value) {
                setState(() {
                  conner = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              activeColor: Colors.pink,
              value: '1',
              groupValue: conner,
              onChanged: (value) {
                setState(() {
                  conner = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normaldrawbackRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'สิ่งกีดขวาง',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damageddrawbackRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              activeColor: Colors.blue,
              value: '0',
              groupValue: drawback,
              onChanged: (value) {
                setState(() {
                  drawback = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              activeColor: Colors.pink,
              value: '1',
              groupValue: drawback,
              onChanged: (value) {
                setState(() {
                  drawback = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normalsaveRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'การบันทึก',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damagedsaveRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              activeColor: Colors.blue,
              value: '0',
              groupValue: camerasave,
              onChanged: (value) {
                setState(() {
                  camerasave = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              activeColor: Colors.pink,
              value: '1',
              groupValue: camerasave,
              onChanged: (value) {
                setState(() {
                  camerasave = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normalpowerRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'การสำรองไฟ',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damagedpowerRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              activeColor: Colors.blue,
              value: '0',
              groupValue: powerbackup,
              onChanged: (value) {
                setState(() {
                  powerbackup = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              activeColor: Colors.pink,
              value: '1',
              groupValue: powerbackup,
              onChanged: (value) {
                setState(() {
                  powerbackup = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );

  // dynamic textNum() {
  //   return Container(
  //       child: Text(
  //     'รหัสกล้องวงจรปิด : $_scanBarcode\n',
  //     style: TextStyle(fontSize: 20),
  //   ));
  // }

  // Row articleNum(double size) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 10),
  //         width: size * 0.8,
  //         // child: TextField(onChanged: (value) => articlenum = value.trim(),
  //         //   decoration: InputDecoration(labelText: '$_scanBarcode'),
  //         // ),
  //         child: TextFormField(
  //           // onChanged: (value) => articlenum = value.trim(),
  //           // controller: article_numController,
  //           // initialValue: barcodeScanRes,
  //           // controller: articleController,
  //           decoration: InputDecoration(
  //             labelStyle: MyConstant().h2(),
  //             labelText: '$_scanBarcode\n',
  //             enabledBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: MyConstant.primary),
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: MyConstant.warning),
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Future<Null> editActive() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String id = preferences.getString('id')!;
  //   // String article_num2 = article_numController.text;
  //   print('######## userid = $id');
  //   print('######## article_num = $_scanBarcode');
  //   String path =
  //       '${MyConstant.domain}/pkoffice/api/getArticle.php?isAdd=true&article_num=$_scanBarcode';
  //   await Dio().get(path).then((value) async {
  //     if (value.toString() == 'null') {
  //       MyDialog()
  //           .normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีข้อมูลกล้องวงจรปิด');
  //     } else {
  //       for (var items in json.decode(value.data!)) {
  //         ArticleModel model = ArticleModel.fromJson(items);
  //         String getarticlenum = model.articleNum.toString();
  //         print('### ==>>>$getarticlenum');
  //         setState(() {
  //           articleModel.add(model);
  //         });
  //       }
  //     }
  //   });
  // }

  Future<Null> updateActive() async {
    String path =
        '${MyConstant.domain}/pkoffice/api/getArticleupdate.php?isAdd=true&cctv_check_id=$cctv_check_id&cctv_camera_screen=$screen&cctv_camera_corner=$conner&cctv_camera_drawback=$drawback&cctv_camera_save=$camerasave&cctv_camera_power_backup=$powerbackup';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('######## Vaaaaaaaaaa = $dd');
      if (value.toString() == 'true') {
        // MyDialog().normalDialog(context, 'บันทึกข้อมูลสำเร็จ', 'สำเร็จ');
        // Navigator.pushNamed(context, MyConstant.routeMaincctvReq);
        Navigator.pop(context);
        // comfirmsaveDialog();
      } else {
        MyDialog().normalDialog(context, 'กรุณาลองใหม่', 'ไม่สำเร็จ');
        // Navigator.pushNamed(context, MyConstant.routeMaincctvReq);
        // Navigator.pop(context);
        // comfirmsaveDialog();
      }
    });
  }

  Future<Null> comfirmsaveDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('แก้ไขข้อมูลสำเร็จ'),
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, const MaincctvReq());
              },
              // onPressed: () =>Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     builder: (context) => MaincctvReq(),
              //   ),
              //   (route) => route.isFirst
              //   // Navigator.pushNamed(context, MyConstant.routeMainCctv);
              //   // Navigator.pushNamedAndRemoveUntil(
              //   // context, MyConstant.routeMaincctvReq, (route) => false);
              // ),
              child: const Text('ปิด'),
            ),
          )
        ],
      ),
    );
  }
}
