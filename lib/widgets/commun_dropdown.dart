// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

class Commondropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  // final String label;
  final String hint;
  final Function(String?) Onchange;
  // final String? Function(String?) validator;

  final TextStyle labelStyle =
      const TextStyle(fontSize: 20, color: Colors.grey);
  final TextStyle hintstyle = const TextStyle(fontSize: 25);

  const Commondropdown({
    super.key,
    required this.Onchange,
    required this.items,
    required this.value,
    // required this.label,
    required this.hint,
    //required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        //validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hint: Text(hint),
        value: value.isEmpty ? hint : value,
        decoration: InputDecoration(
          // labelText: label,
          hintStyle: hintstyle,
          //labelStyle: labelStyle
        ),
        items: items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 15,fontFamily: 'mp'),
                ),
              ),
            )
            .toList(),
        onChanged: Onchange,
        isExpanded: true,
      ),
    );
  }
}
