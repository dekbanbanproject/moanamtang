import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moanamtang/utility/my_constant.dart';
import 'package:moanamtang/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUserProfilr extends StatefulWidget {
  const MainUserProfilr({super.key});

  @override
  State<MainUserProfilr> createState() => _MainUserProfilrState();
}

class _MainUserProfilrState extends State<MainUserProfilr> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passappController = TextEditingController();
  void clearField() {
    usernameController.clear();
    passappController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Center(
            child: Text(
              'Profile',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Kanit-Regular',
                color: Color.fromARGB(255, 4, 197, 193),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                // builAppname(),
                buildUser(size),
                buildPassword(size),
                updateButtom(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildSubmitlogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          width: size * 0.6,
          child: ElevatedButton(
            style: MyConstant().mybuttonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String username = usernameController.text;
                String passapp = passappController.text;
                print('## username = $username, passapp = $passapp');
                checkLogin(username: username, passapp: passapp);
                // checkAuthen();
              }
            },
            child: Text(
              'Login',
              style: MyConstant().h2White(),
            ),
            // child:  ElevatedButton(
            //                 onPressed: () => scanQR(),
            //              child: Text('Start QR scan'))
          ),
        ),
      ],
    );
  }

  Row updateButtom(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          width: size * 0.6,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.fingerprint,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 30.0,
                ),
              ),
              label: Text(
                'Update',
                style: MyConstant().h2save(),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String username = usernameController.text;
                  String passapp = passappController.text;
                  print('## username = $username, passapp = $passapp');
                  checkLogin(username: username, passapp: passapp);
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 222, 248, 244)),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> checkLogin({String? username, String? passapp}) async {
    String apicheckLogin =
        '${MyConstant.domain}/pkoffice/api/signin.php?isAdd=true&username=$username';
    await Dio().get(apicheckLogin).then((value) async {
      print('## value for API  ==>  $value');
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String id = preferences.getString('id')!;
      print('######## userid = $id');
      if (value.toString() == 'null') {
        String path =
            '${MyConstant.domain}/pkoffice/api/updateprofile.php?isAdd=true&username=$username&id=$id&password=$passapp';
        Response res = await Dio().get(path);
        print('######## ressssssss = $res');
        try {
          if (res.toString() == 'true') {
            MyDialog()
                .normalDialog(context, 'Update Profile Success', 'Success');
            clearField();
          } else {
            MyDialog()
                .normalDialog(context, 'Update Profile UnSuccess', 'UnSuccess');
          }
        } catch (e) {}
      } else {
        MyDialog().normalDialog(
            context, 'มี $username ในฐานข้อมูลแล้ว', 'Username ซ้ำ');
      }
    });
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: size * 0.6,
          child: TextFormField(
            controller: passappController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก Password';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: statusRedEye
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: Color.fromARGB(255, 27, 207, 180),
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromARGB(255, 27, 207, 180),
                        )),
              labelStyle: MyConstant().h2(),
              labelText: 'Password ',
              prefixIcon: const Icon(
                Icons.lock_open,
                color: Color.fromARGB(255, 27, 207, 180),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 27, 207, 180)),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25),
          width: size * 0.6,
          child: TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก username';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h2(),
              labelText: 'Username ',
              prefixIcon: const Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 27, 207, 180),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 27, 207, 180)),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: size * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 110,
              child: Image.asset(
                "images/technician_1.png",
                // "images/techserevice.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
