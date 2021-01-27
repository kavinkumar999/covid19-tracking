import 'package:covid19/bloc/country_record/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}
  List<dynamic> record =  new List();

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
            if(state is Recordstarted){
              print(state.record[0]["country"]);
              print("recorde");
            }
            if(state is Exception){
              print("exception");
            }
          },
          builder: (context, state) {
            if (state is Recordstarted) {
              record = state.record;
              // print(type(record));
              print(record);
              return ListView.builder(
                itemCount:  state.record.length == 0 ? 0 : state.record.length,
                itemBuilder: (BuildContext context, int index) {
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
                            "home",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            LineAwesomeIcons.arrow_circle_o_right,
                            color: Colors.pink,
                          ),
                          hoverColor: Colors.pink,
                          focusColor: Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return Container();
            }
          },
        ));
  }
}
