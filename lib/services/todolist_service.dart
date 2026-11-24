import 'package:dio/dio.dart';
import 'package:flutter_todolist1_3/model/todolist_model.dart';

class TodolistService {
  static Dio dio= Dio();
  static Future<TodoLists>getdata()async{
    try{
      Response response= await dio.get("https://mytodoapi.runasp.net/api/TodoItems/");
      return TodoLists.fromJson(response.data);
    }
    on DioException catch(dioerror){
      throw Exception(dioerror.message);
    }
    catch(othererror){
       throw Exception(othererror.toString());
    }
  }
    static Future<void>putdata({required int id,required String title})async{
    try{
    await dio.put("https://mytodoapi.runasp.net/api/TodoItems/$id",data: {
        "title":title
      });
    
    }
    on DioException catch(dioerror){
      throw Exception(dioerror.message);
    }
    catch(othererror){
       throw Exception(othererror.toString());
    }
  }
   static Future<void>deletedata({required int id,})async{
    try{
    await dio.delete("https://mytodoapi.runasp.net/api/TodoItems/$id"
      );
     
    }
    on DioException catch(dioerror){
      throw Exception(dioerror.message);
    }
    catch(othererror){
       throw Exception(othererror.toString());
    }
  }
    static Future<void>adddata({required String title,required String descreption})async{
    try{
      await dio.post("https://mytodoapi.runasp.net/api/TodoItems/",data: {
        "title":title,
        "descreption":descreption
      }
      );

    }
    on DioException catch(dioerror){
      throw Exception(dioerror.message);
    }
    catch(othererror){
       throw Exception(othererror.toString());
    }
  }
}