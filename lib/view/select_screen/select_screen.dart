import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/controller/mycontroller.dart';
import 'package:task_app/utils/colorconstant/colorconstant.dart';
import 'package:task_app/utils/textconstant/textconstant.dart';

class SelectedScreen extends StatefulWidget {
  const SelectedScreen({super.key});

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  @override
  Widget build(BuildContext context) {
    final controllProvider = Provider.of<MyController>(context);
    final controllProviderFn =
        Provider.of<MyController>(context, listen: false);

    bool value = true;
    return Scaffold(
        backgroundColor: ColorConstant.scaffoldColor,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 80,
          title: Text(
            "Create new task",
            style: TextConstant.cratenewtask,
          ),
          backgroundColor: ColorConstant.scaffoldColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              headerProps: const EasyHeaderProps(
                selectedDateStyle: TextStyle(color: Colors.white),
                monthStyle: TextStyle(color: Colors.white),
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateDMY(),
              ),
              dayProps: const EasyDayProps(
                borderColor: Colors.black,
                todayHighlightColor: Colors.purple,
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3371FF),
                        Color(0xff8426D6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Schedule",
                      style: TextConstant.selectedpageheading,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: ColorConstant.containerColor,
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextFormField(
                            controller: controllProvider.nameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name",
                                hintStyle: TextConstant.selectedsearchtitle)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: ColorConstant.containerColor,
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextFormField(
                            controller: controllProvider.desController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Description",
                                hintStyle: TextConstant.selectedsearchtitle)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Time",
                              style: TextConstant.selectedpagesubheading,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 58,
                              width: 195,
                              decoration: BoxDecoration(
                                  color: ColorConstant.containerColor,
                                  borderRadius: BorderRadius.circular(14)),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "06 : 00 PM",
                                      hintStyle: TextConstant.time,
                                      prefixIcon: Icon(
                                        Icons.lock_clock,
                                        color: ColorConstant.purple,
                                      ))),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End Time",
                              style: TextConstant.selectedpagesubheading,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 58,
                              width: 185,
                              decoration: BoxDecoration(
                                  color: ColorConstant.containerColor,
                                  borderRadius: BorderRadius.circular(14)),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "09 : 00 PM",
                                      hintStyle: TextConstant.time,
                                      prefixIcon: Icon(
                                        Icons.lock_clock,
                                        color: ColorConstant.purple,
                                      ))),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Get alert for this task",
                          style: TextConstant.selectedpagesubheading,
                        ),
                        Switch(
                          trackOutlineColor:
                              MaterialStatePropertyAll(ColorConstant.purple),
                          inactiveTrackColor: ColorConstant.scaffoldColor,
                          activeTrackColor: ColorConstant.violet,
                          inactiveThumbColor: ColorConstant.primarywhite,
                          activeColor: ColorConstant.primarywhite,
                          value: value,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        controllProviderFn.addTotask();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                                colors: [
                                  ColorConstant.purple,
                                  ColorConstant.pink
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: Center(
                          child: Text(
                            "Create Task",
                            style: TextConstant.cratetask,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            )
          ],
        ));
  }
}
