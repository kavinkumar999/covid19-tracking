import 'package:covid19/data_layer/data.dart';

import 'package:covid19/data_layer/data.dart';

class Repository{


  final Database _database =  Database();
  Future<List<dynamic>> getdatabase() async{


    try {
      List<dynamic> record =  new List();
     record =  await _database.getrecords();
     return record;
      
    } catch (e) {
      throw e;
    }
     

    
  }
}