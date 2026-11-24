import 'package:flutter/foundation.dart';
import 'package:flutter_todolist1_3/model/todolist_model.dart';
import 'package:flutter_todolist1_3/services/todolist_service.dart';

class TodolistProvider  extends ChangeNotifier{
  TodoLists? lists;
  Future <void> getdataprovider()async{
     lists=await TodolistService.getdata();
    notifyListeners();
  }
    Future <void> adddataprovider({required String title,required String descreption})async{
    await TodolistService.adddata(title: title, descreption: descreption);
    await getdataprovider();
  }
    Future <void> updatedataprovider({required int id,required String title})async{
     await TodolistService.putdata(id: id, title: title);
    await getdataprovider();
  }
    Future <void> deletedataprovider({required int id,})async{
     await TodolistService.deletedata(id: id);
    await getdataprovider();
  }
}