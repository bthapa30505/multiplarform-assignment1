import 'package:flutter/material.dart';

class ConversionDropdown extends StatelessWidget {
  final String selectedUnit;
  final Function(String) onChanged;

  static const List<String> units = [
    'Meters', 'Feet', 'Kilometers', 'Miles', 'Kilograms', 'Pounds'
  ];

  const ConversionDropdown({
    super.key,
    required this.selectedUnit,
    required this.onChanged,
  });

  //This widget is used as a dropdown option that is reusable on two different places.
  //It returns the new value when changed.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the dropdown button take full width
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedUnit,
          isExpanded: true, // Ensures the dropdown menu takes full width
          items: units.map((unit) {
            return DropdownMenuItem(
              value: unit,
              child: Text(unit),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ),
    );
  }
}
