import 'package:flutter/material.dart';
import 'package:moanamtang/widgets/home_app_bar.dart';

class FireAddPage extends StatefulWidget {
  const FireAddPage({super.key});

  @override
  State<FireAddPage> createState() => _FireAddPageState();
}

class _FireAddPageState extends State<FireAddPage> {
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
              SizedBox(height: 15),
              Center(
                child: Text(
                  'FireAddPage',style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 27, 207, 180)), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}