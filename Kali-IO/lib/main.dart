import 'package:flutter/material.dart';

void main() {
  runApp(TipCalculator());
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _billAmount = 0.0;
  double _tipPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tip Calculator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bill Amount',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter bill amount in rupees',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _billAmount = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Tip Percentage: ${_tipPercentage.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Slider(
                value: _tipPercentage,
                min: 0,
                max: 100,
                divisions: 10,
                label: _tipPercentage.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _tipPercentage = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Tip Amount: ${(_billAmount * _tipPercentage / 100).toStringAsFixed(2)} Rupees',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
