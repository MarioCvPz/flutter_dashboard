import 'package:flutter/material.dart';

/// Tarjeta de resumen con icono, número, título y texto de variación (verde/rojo).
/// Fondo teal y borde negro.
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

  /// Título de la métrica (ej: "Usuarios activos")
  final String title;

  /// Número principal (ej: "1.234" o "78%")
  final String number;

  /// Texto de variación (ej: "+12%" o "-5%") — color verde si positivo, rojo si negativo
  final String variationText;

  /// Icono de la tarjeta
  final IconData icon;
  final Color iconColor;

  /// Si es true el texto de variación es verde; si es false, rojo
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
          // 1. Icono
          Center(child: Icon(icon, size: 32, color: iconColor)),
          const SizedBox(height: 8),
          // 2. Número (o porcentaje)
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
          // 3. Título
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
          // 4. Texto de variación (verde o rojo)
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
