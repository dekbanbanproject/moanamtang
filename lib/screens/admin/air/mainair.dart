import 'package:flutter/material.dart';
import 'package:moanamtang/widgets/home_app_bar.dart';

class MainAirPage extends StatefulWidget {
  const MainAirPage({super.key});

  @override
  State<MainAirPage> createState() => _MainAirPageState();
}

class _MainAirPageState extends State<MainAirPage> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              //for custom appbar
              CustomAppBar(),
              //for searchbar
              SizedBox(height: 15),
              Center(
                child: Text(
                  'MainAirPage',style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 27, 207, 180)), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}