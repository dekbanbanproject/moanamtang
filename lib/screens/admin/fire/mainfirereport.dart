import 'package:flutter/material.dart';
import 'package:moanamtang/utility/my_constant.dart';
import 'package:moanamtang/widgets/home_app_bar.dart';

class MainFirereport extends StatefulWidget {
  const MainFirereport({super.key});

  @override
  State<MainFirereport> createState() => _MainFirereportState();
}

class _MainFirereportState extends State<MainFirereport> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 1, left: 1, right: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              //for custom appbar
              Padding(
                padding: EdgeInsets.only(top: 30, left: 2, right: 2),
                child: CustomAppBar(),
              ),
              //for searchbar
              // SizedBox(height: 15),
              Center(
                child: Text(
                  'MainFirereport',style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 27, 207, 180)), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}