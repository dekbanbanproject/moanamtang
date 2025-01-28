import 'package:flutter/material.dart';
import 'package:moanamtang/widgets/home_app_bar.dart';

class MainReport extends StatefulWidget {
  const MainReport({super.key});

  @override
  State<MainReport> createState() => _MainReportState();
}

class _MainReportState extends State<MainReport> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 236, 236),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15), 
              CustomAppBar(), 
              SizedBox(height: 15),
              Center(
                child: Text(
                  'MainReport',style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 27, 207, 180)), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}