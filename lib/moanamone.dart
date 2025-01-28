import 'package:flutter/material.dart';
import 'package:moanamtang/utility/my_constant.dart';
import 'package:moanamtang/widgets/show_title.dart';
import 'package:google_fonts/google_fonts.dart';

class MoanamonePage extends StatefulWidget {
  const MoanamonePage({super.key});

  @override
  State<MoanamonePage> createState() => _MoanamonePageState();
}

class _MoanamonePageState extends State<MoanamonePage> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();

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
                buildImagePK(),
                builAppname(),
                // buildUser(size),
                // buildPassword(size),
                buildSubmit(size),
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
          margin: const EdgeInsets.only(top: 90),
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
        margin: const EdgeInsets.only(top: 2),
        child: Text(
          'หมอนำทาง',
          style: GoogleFonts.lato(
            // textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 48,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
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
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size * 0.7,
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
              'Scan qrcode',
              style: MyConstant().h1login(),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                backgroundColor: Color.fromARGB(255, 238, 255, 252)),
          ),
        ),
      ),
    ],
  );
}
