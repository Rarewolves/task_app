import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/controller/mycontroller.dart';
import 'package:task_app/utils/colorconstant/colorconstant.dart';
import 'package:task_app/utils/textconstant/textconstant.dart';
import 'package:task_app/view/edited_screen/edited_screen.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});
  bool check = true;
  @override
  Widget build(BuildContext context) {
    final controllProvider = Provider.of<MyController>(context);

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today's Task",
              style: TextConstant.heading,
            ),
            Text(
              "See All",
              style: TextConstant.rowheading,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controllProvider.tasklist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controllProvider.index(index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditedScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controllProvider.tasklist[index].mylist[index]
                                  ["title"],
                              style: TextConstant.titlecontainerheading,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 18,
                                  color: ColorConstant.primarywhite,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("4 Oct",
                                    style:
                                        TextConstant.subtitlecontainerheading),
                              ],
                            ),
                          ],
                        ),
                        Checkbox(
                          activeColor: ColorConstant.purple,
                          checkColor: ColorConstant.primaryblack,
                          side: BorderSide(
                            color: ColorConstant.purple,
                          ),
                          shape: CircleBorder(),
                          value: check,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                      color: ColorConstant.containerColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
