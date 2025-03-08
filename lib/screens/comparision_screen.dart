import 'package:flutter/material.dart';
import '../widgets/conversion_dropdown.dart';
import '../widgets/conversion_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fromUnit = 'Miles';
  String toUnit = 'Kilometers';
  double inputValue = 0;
  String result = '';

  final Map<String, double> conversionRates = {
    // Listing values for all possible conversions.
    'Meters to Feet': 3.28084,
    'Feet to Meters': 0.3048,
    'Kilometers to Miles': 0.621371,
    'Miles to Kilometers': 1.60934,
    'Kilometers to Meters': 1000.0,
    'Meters to Kilometers': 0.001,
    'Miles to Feet': 5280.0,
    'Feet to Miles': 0.000189394,

    // For weight there are only two possible conversions.
    'Kilograms to Pounds': 2.20462,
    'Pounds to Kilograms': 0.453592,
  };

  // If the conversion is valid, show the result; otherwise, show an error message.
  void convert() {
    String key = '$fromUnit to $toUnit';
    setState(() {
      if (conversionRates.containsKey(key) && inputValue > 0) {
        double convertedValue = (conversionRates[key] ?? 1) * inputValue;
        result = "$inputValue $fromUnit are ${convertedValue.toStringAsFixed(2)} $toUnit";
      } else {
        result = 'Sorry, this is not a valid conversion.';
      }
    });
  }

  //This is the main screen of the app.
  //It contains the dropdowns, input field, and the result of the conversion.
  //It imports two widgets: ConversionDropdown and ConversionResult.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Set rest of the screen to gray
      appBar: AppBar(
        title: const Text(
          'Measure Converter',
          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800], // Blue AppBar
        centerTitle: true,
      ),
      body: Column(
        children: [

          // Gray Content Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Value',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        inputValue = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter a number',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'From',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ConversionDropdown(
                    selectedUnit: fromUnit,
                    onChanged: (value) => setState(() => fromUnit = value),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'To',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ConversionDropdown(
                    selectedUnit: toUnit,
                    onChanged: (value) => setState(() => toUnit = value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: convert,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Blue button
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Convert'),
                  ),
                  const SizedBox(height: 20),
                  ConversionResult(result: result),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
