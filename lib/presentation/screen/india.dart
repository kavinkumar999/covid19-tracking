import 'package:covid19/bloc/india_record/india_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:covid19/presentation/widgets/card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<IndiaRecordBloc>(context).add(Startfetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Commoncard _card = new Commoncard();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: RefreshIndicator(
          onRefresh: () {},
          child: BlocConsumer<IndiaRecordBloc, IndiaRecordState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is Exception)
                Fluttertoast.showToast(
                    msg: "Server error",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);

              if (state is Previousdata)
                Fluttertoast.showToast(
                    msg: "Live data is not Avaliable",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.pink,
                    textColor: Colors.white,
                    fontSize: 16.0);
            },
            builder: (context, state) {
              if (state is Startfunction) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 6.0,
                  ),
                );
              }
              if (state is Recordfetch) {
                String countryname = state.indiadata["country"];
                int totalcase = state.indiadata["cases"];
                int recovered = state.indiadata["recovered"];
                int active = state.indiadata["deaths"];
                int death = state.indiadata["active"];
                countryname = countryname.toUpperCase();
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Image(
                                alignment: Alignment.topLeft,
                                height: 300,
                                width: 300,
                                image: AssetImage("assests/india.png"),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "$countryname",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            _card.colorcard(context, "Total Cases",
                                Colors.green, (totalcase)),
                            _card.colorcard(
                                context, "Active Cases", Colors.pink, (active)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            _card.colorcard(
                                context, "Recovered", Colors.blue, (recovered)),
                            _card.colorcard(
                                context, "Death Cases", Colors.purple, (death)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          width: 100,
                          height: 100,
                          image: AssetImage("assests/covid12.png"),
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                );
              }
              if (state is Previousdata) {
                String countryname = state.indiadata["country"];
                int totalcase = state.indiadata["cases"];
                int recovered = state.indiadata["recovered"];
                int active = state.indiadata["deaths"];
                int death = state.indiadata["active"];
                countryname = countryname.toUpperCase();
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Image(
                                alignment: Alignment.topLeft,
                                height: 300,
                                width: 300,
                                image: AssetImage("assests/india.png"),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "$countryname",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            _card.colorcard(context, "Total Cases",
                                Colors.green, (totalcase)),
                            _card.colorcard(
                                context, "Active Cases", Colors.pink, (active)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            _card.colorcard(
                                context, "Recovered", Colors.blue, (recovered)),
                            _card.colorcard(
                                context, "Death Cases", Colors.purple, (death)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          width: 100,
                          height: 100,
                          image: AssetImage("assests/covid12.png"),
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                );
              }
              return Center(child: Text("Record not found"));
            },
          ),
        ));
  }
}
