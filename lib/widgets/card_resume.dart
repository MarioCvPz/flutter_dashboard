import 'package:flutter/material.dart';

class CardResume extends StatelessWidget {
  const CardResume({
    super.key,
    required this.title,
    required this.number,
    required this.variationText,
    required this.icon,
    required this.iconColor,
    this.isPositive = true,
  });

  final String title;
  final String number;
  final String variationText;
  final IconData icon;
  final Color iconColor;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final variationColor = isPositive
        ? Colors.lightGreen.shade800
        : Colors.red.shade800;

    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade200,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Icon(icon, size: 32, color: iconColor)),
          const SizedBox(height: 8),
          Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              variationText,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: variationColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
