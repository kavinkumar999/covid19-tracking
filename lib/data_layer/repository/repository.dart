import 'package:covid19/data_layer/data.dart';

import 'package:covid19/data_layer/data.dart';

class Repository {
  final Database _database = Database();
  Future<List<dynamic>> getdatabase() async {
    try {
      List<dynamic> record = new List();
      record = await _database.getrecords();
      return record;
    } catch (e) {
      throw e;
    }
  }

  Future<List<dynamic>> getprevious() async {
    try {
      List<dynamic> record = new List();
      record = await _database.getprevious();
      return record;
    } catch (e) {
      throw e;
    }
  }
  Future<Map<String,dynamic>> indiacases() async {
    try {
      Map<String,dynamic> indiadata = new Map();
      indiadata = await _database.indiacasesdb();
      return indiadata;
    } catch (e) {
      throw e;
    }
  }
}
