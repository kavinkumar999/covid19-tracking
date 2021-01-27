import 'package:covid19/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class Serparate extends StatefulWidget {
  String country;
  int totalcase, active, recovered, death;

  Serparate(
      this.country, this.totalcase, this.active, this.recovered, this.death);
      

  @override
  _SerparateState createState() => _SerparateState(country ,totalcase,active,recovered,death);
}

class _SerparateState extends State<Serparate> {
  String country;
  int totalcase, active, recovered, death;
  _SerparateState(
    this.country, this.totalcase, this.active, this.recovered, this.death
  );
  Commoncard _card = new Commoncard();
  
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(left: 20),

        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Text(
                  "${widget.country}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                _card.colorcard(
                    context, "Total Cases", Colors.green, (totalcase)),
                _card.colorcard(
                    context, "Active Cases", Colors.pink, active),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _card.colorcard(
                    context, "Recovered", Colors.blue, recovered),
                _card.colorcard(context, "Death Cases", Colors.red, death),
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
}
