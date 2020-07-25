import 'package:flutter/material.dart';

void main() =>runApp(FuelCalculator());

class FuelCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    body: Container (
      decoration: BoxDecoration (
        image: DecorationImage (
          image: AssetImage("Images/car1.jpg"),
          fit: BoxFit.cover,
      ),
      ),
    return MaterialApp (
      title: 'Fuel Cal',
      home: Calculator(),
    );

  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  final currencyTypes = ['LKR', 'Dollar', 'Pounds'];
  String currency = 'LKR';

  String resultText = "";

  TextEditingController distancePer1L = TextEditingController();
  TextEditingController distanceOfTravel = TextEditingController();
  TextEditingController priceOfFuel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Calculator'),
        leading: Icon(Icons.directions_car, color: Colors.deepOrange,),
      ),

      body: Container(

        padding: EdgeInsets.all(17),
        child: Column(
          children: <Widget>[

            TextField(
              controller: distancePer1L,
              decoration: InputDecoration(
                labelText: 'Distance Per 1L(km)',
                hintText: "eg:12"
              ),
              keyboardType: TextInputType.number,
            ),

            TextField(
              controller: distanceOfTravel,
              decoration: InputDecoration(
                  labelText: 'Distance of Travel',
                  hintText: "30km"
              ),
              keyboardType: TextInputType.number,
            ),

            TextField(
              controller: priceOfFuel,
              decoration: InputDecoration(
                  labelText: 'Price of 1L Fuel',
              ),
              keyboardType: TextInputType.number,
            ),

            DropdownButton<String>(
              items: currencyTypes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: currency,
              onChanged: (String value) {
                onDropDownChanged(value);
              },
            ),

            RaisedButton(
              color: Colors.deepOrange,
              child: Text('Calculate '),
              onPressed: (){
                setState(() {
                  resultText = calculateFuelPrice();
                });
              },

            ),

            Text(resultText)

          ],
        )
      )
    );
  }
  onDropDownChanged(String value) {
    setState(() {
      this.currency = value;
    });
  }

  String calculateFuelPrice() {
    double distanceLitre = double.parse(distancePer1L.text);
    double distance = double.parse(distanceOfTravel.text);
    double fuelPrice = double.parse(priceOfFuel.text);

    double totalCost = (distance/distanceLitre) * fuelPrice;
    String resultText = "Total Cost" + totalCost.toString() +" " + currency;
    return resultText;
  }
  ),
}

