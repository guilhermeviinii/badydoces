import 'package:flutter/material.dart';

class DropDownInputWidget extends StatefulWidget {
  final List list;
  final String label;

  const DropDownInputWidget({Key key, this.list, this.label}) : super(key: key);

  @override
  _DropDownInputWidgetState createState() => _DropDownInputWidgetState();
}

class _DropDownInputWidgetState extends State<DropDownInputWidget> {
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.fromBorderSide(
            BorderSide(color: Color(0xFF4360F6), width: 2.0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          hint: Text(widget.label),
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          value: _selectedLocation,
          items: widget.list.map((e) {
            return DropdownMenuItem<String>(
              value: e.name,
              child: Text(e.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
