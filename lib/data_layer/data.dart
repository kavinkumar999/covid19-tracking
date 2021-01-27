import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid19/services/api.dart';
class Database{

  Future<List<dynamic>> getrecords() async{
     List<dynamic> record =  new List();
     try {
       final http.Response data = await http.get("https://coronavirus-19-api.herokuapp.com/countries");
        if(data.statusCode == 200){
          print("success");
          print(jsonDecode(data.body));
          record =  jsonDecode(data.body);
        }
        print(data.statusCode);
        return record;
       
     } catch (e) {
       throw e;
     }
     
  }
}