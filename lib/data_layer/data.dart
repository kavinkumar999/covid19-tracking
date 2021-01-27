import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid19/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  Future<List<dynamic>> getrecords() async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences manager = await SharedPreferences.getInstance();
    List<dynamic> record = new List();
    try {
      final http.Response data = await http.get(url);
      if (data.statusCode == 200) {
        manager.setString('countrydata', data.body);
        record = jsonDecode(data.body);
        return record;
      }
      return record;
    } catch (e) {
      throw e;
    }
  }

  Future<List<dynamic>> getprevious() async {
    SharedPreferences.setMockInitialValues({});

    SharedPreferences manager = await SharedPreferences.getInstance();
    List<dynamic> record = new List();
    try {
      record = jsonDecode(manager.getString("countrydata"));
      return record;
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> indiacasesdb() async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences indiadata = await SharedPreferences.getInstance();
    Map<String, dynamic> record = new Map();
    try {
      final http.Response data = await http.get(url);
      if (data.statusCode == 200) {
        record["country"] = jsonDecode(data.body)[2]['country'];
        record["cases"] = jsonDecode(data.body)[2]['cases'];
        record["recovered"] = jsonDecode(data.body)[2]['recovered'];
        record["deaths"] = jsonDecode(data.body)[2]['deaths'];
        record["active"] = jsonDecode(data.body)[2]['active'];
        // indiadata.setString('countryname', record["country"]);
        // indiadata.setString('todayCases', record["todayCases"]);
        // indiadata.setString('recovered', record["recovered"]);
        // indiadata.setString('deaths', record["deaths"]);
        // indiadata.setString('active', record["active"]);
        return record;
      }
      return record;
    } catch (e) {
      throw e;
    }
  }
}
