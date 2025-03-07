import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:moanamtang/utility/my_constant.dart';
import 'package:moanamtang/widgets/home_app_bar.dart';
import 'package:moanamtang/widgets/search_bar.dart';

class VisitPatientPage extends StatefulWidget {
  const VisitPatientPage({super.key});

  @override
  State<VisitPatientPage> createState() => _VisitPatientPageState();
}

class _VisitPatientPageState extends State<VisitPatientPage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 250, 249),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Padding(
      //     padding: EdgeInsets.only(right: 5),
      //     child: Center(
      //       child: Text(
      //         'Visit Patient',
      //         // _gleaveModel.LEAVE_PERSON_FULLNAME,
      //         style: TextStyle(
      //           fontSize: 30,
      //           fontFamily: 'Kanit-Regular',
      //           color: Color.fromARGB(255, 4, 197, 193),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              CustomAppBar(),
              SizedBox(height: 15),
              // MySearchBar(),
              IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: MyConstant.kprimaryColor,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  playsound();
                },
                iconSize: 30,
                color: Colors.lightBlue,
                icon: const Icon(Icons.audio_file),
              ),Text("test Audio")
            ],
          ),
        ),
      ),
    );
  }

  Future<void> playsound() async {
    String audioPath = "audio/bearkidhod.mp3";
    await player.play(AssetSource(audioPath));
  }
  // dynamic playsound() => playsound();
}
