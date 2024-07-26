import 'package:flutter/material.dart';

class ButtonConfig {
  final String label;
  final Color textColor;
  final Color backgroundColor;
  final int flex;
  final BorderRadius borderRadius;

  ButtonConfig(this.label, this.textColor, this.backgroundColor, {this.flex = 1, this.borderRadius = BorderRadius.zero});
}

class ButtonRow extends StatelessWidget {
  final List<ButtonConfig> buttonConfigs;
  final Function(String) onPressed;

  ButtonRow({required this.buttonConfigs, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttonConfigs.map((config) {
        return Expanded(
          flex: config.flex,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: config.backgroundColor, // Updated property name
                shape: RoundedRectangleBorder(
                  borderRadius: config.borderRadius,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              onPressed: () => onPressed(config.label),
              child: Text(
                config.label,
                style: TextStyle(
                  color: config.textColor,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
