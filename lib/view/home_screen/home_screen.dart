import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/controller/mycontroller.dart';
import 'package:task_app/utils/colorconstant/colorconstant.dart';
import 'package:task_app/utils/iconconstant/iconconstant.dart';
import 'package:task_app/utils/imageconstant/imageconstant.dart';
import 'package:task_app/utils/textconstant/textconstant.dart';
import 'package:task_app/view/home_screen/widget/card_screen.dart';
import 'package:task_app/view/select_screen/select_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllProvider = Provider.of<MyController>(context);

    return Scaffold(
      backgroundColor: ColorConstant.scaffoldColor,
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: ColorConstant.scaffoldColor,
//         title: Text(
//           """You have got 5 tasks
// today to complete""",
//           style: TextConstant.title,
//         ),
//       ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 48, right: 20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            """You have got 5 tasks today to complete""",
                            style: TextConstant.title,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            backgroundColor: ColorConstant.purple,
                            radius: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                          color: ColorConstant.containerColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Task Here",
                        hintStyle: TextConstant.searchtitle,
                        prefixIcon: Image.asset(
                          IconConstant.search,
                          scale: 10,
                          color: ColorConstant.primarywhite,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Progress",
                              style: TextConstant.heading,
                            ),
                            Text(
                              "See All",
                              style: TextConstant.smallheading,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Daily Task",
                                  style: TextConstant
                                      .progresstitlecontainerheading,
                                ),
                                Text(
                                  "2/3 Task Completed",
                                  style: TextConstant
                                      .progresssubtitlecontainerheading,
                                ),
                                Text(
                                  "You are almost done go ahead",
                                  style: TextConstant
                                      .progresssubsubtitlecontainerheading,
                                ),
                              ],
                            ),
                          ),
                          height: 139,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              color: ColorConstant.containerColor,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) => CardScreen())
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectedScreen(),
              ));
        },
        child: Image.asset(
          IconConstant.Add,
          scale: 6,
        ),
        backgroundColor: ColorConstant.purple,
      ),
    );
  }
}
