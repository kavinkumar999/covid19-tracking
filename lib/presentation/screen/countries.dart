import 'package:covid19/bloc/country_record/country_bloc.dart';
import 'package:covid19/presentation/screen/separate.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

List<dynamic> records = new List();

class _CountryState extends State<Country> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CountryBloc>(context)..add(Refreshtype());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocConsumer<CountryBloc, CountryState>(
          listener: (context, state) {
            if (state is Exception) {
              Fluttertoast.showToast(
                  msg: "Server error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            if (state is Waiting) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                ),
              );
            }
            if (state is Recordstarted) {
              records = state.record;
              return ListView.builder(
                itemCount: records.length == 0 ? 0 : records.length,
                itemBuilder: (BuildContext context, int index) {
                  var countryname = records[index]["country"];
                  return RefreshIndicator(
                    backgroundColor: Colors.green,
                    onRefresh: () {
                      BlocProvider.of<CountryBloc>(context)..add(Refreshtype());
                    },
                    child: SingleChildScrollView(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Serparate(
                                        records[index]["country"],
                                        records[index]["cases"],
                                        records[index]["active"],
                                        records[index]["recovered"],
                                        records[index]["deaths"]),
                                  ));
                        },
                                              child: Card(
                          color: Colors.grey[850],
                          shadowColor: Colors.white,
                          elevation: 20,
                          child: ListTile(
                            leading: Icon(
                              LineAwesomeIcons.globe,
                              color: Colors.white,
                            ),
                            title: Text(
                              "$countryname",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                LineAwesomeIcons.arrow_circle_o_right,
                                color: Colors.pink,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Serparate(
                                          records[index]["country"],
                                          records[index]["cases"],
                                          records[index]["active"],
                                          records[index]["recovered"],
                                          records[index]["deaths"]),
                                    ));
                              },
                            ),
                            hoverColor: Colors.pink,
                            focusColor: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is Previousdata) {
              records = state.record;
              return ListView.builder(
                itemCount: records.length == 0 ? 0 : records.length,
                itemBuilder: (BuildContext context, int index) {
                  var countryname = records[index]["country"];
                  if (state is Waiting) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.purple,
                      strokeWidth: 6.0,
                    );
                  }
                  return RefreshIndicator(
                    backgroundColor: Colors.green,
                    onRefresh: () {
                      BlocProvider.of<CountryBloc>(context)..add(Refreshtype());
                    },
                    child: SingleChildScrollView(
                      child: Card(
                        color: Colors.grey[850],
                        shadowColor: Colors.white,
                        elevation: 20,
                        child: ListTile(
                          leading: Icon(
                            LineAwesomeIcons.globe,
                            color: Colors.white,
                          ),
                          title: Text(
                            "$countryname",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              LineAwesomeIcons.arrow_circle_o_right,
                              color: Colors.pink,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Serparate(
                                        records[index]["country"],
                                        records[index]["cases"],
                                        records[index]["active"],
                                        records[index]["recovered"],
                                        records[index]["deaths"]),
                                  ));
                            },
                          ),
                          hoverColor: Colors.pink,
                          focusColor: Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Data Not found"),
              );
            }
          },
        ));
  }
}
