import 'package:flutter/material.dart';
import 'package:task_app/model/mymodel.dart';

class MyController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  MyModel? myModel;
  List<MyModel> tasklist = [];
  addTotask() {
    tasklist.add(MyModel(mylist: [
      {
        "heading": "Today's Task",
        "title": nameController.text,
        "description": desController.text
      }
    ]));
    notifyListeners();
  }

  int? Index;
  index(int index) {
    Index = index;
  }
}
