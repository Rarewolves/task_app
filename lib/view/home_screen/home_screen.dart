import 'package:flutter/material.dart';
import 'package:task_app/utils/colorconstant/colorconstant.dart';
import 'package:task_app/utils/imageconstant/imageconstant.dart';
import 'package:task_app/utils/textconstant/textconstant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorConstant.scaffoldColor,
        title: Text(
          """You have got 5 tasks 
today to complete""",
          style: TextConstant.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            Container(
              height: 44,
              decoration: BoxDecoration(
                  color: ColorConstant.containerColor,
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Task Here",
                    hintStyle: TextConstant.searchtitle),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          ImageConstant.buttonImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
