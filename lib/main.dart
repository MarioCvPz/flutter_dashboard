import 'package:flutter/material.dart';
import 'package:flutter_dashboard/widgets/card_resume.dart';

const List<Color> _coloresBarras = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.red,
  Colors.purple,
  Colors.teal,
  Colors.indigo,
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey _keyMetricas = GlobalKey();
  final GlobalKey _keyDesempeno = GlobalKey();
  final GlobalKey _keyTransacciones = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.08,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<int> datosGrafico = [65, 42, 78, 91, 55];
    const List<String> diasSemana = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie'];

    const List<Map<String, dynamic>> transacciones = [
      {'id': '#1001', 'monto': '125.50€', 'estado': '✅ Completado'},
      {'id': '#1002', 'monto': '89.99€', 'estado': '⏱ Pendiente'},
      {'id': '#1003', 'monto': '234.75€', 'estado': '✗ Cancelado'},
      {'id': '#1004', 'monto': '456.00€', 'estado': '✅ Completado'},
      {'id': '#1005', 'monto': '178.25€', 'estado': '⏱ Pendiente'},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text(
            'Dashboard',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KeyedSubtree(
                  key: _keyMetricas,
                  child: Text(
                    'Métricas principales',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.teal, thickness: 3),
                const SizedBox(height: 16), //Divider
                Row(
                  children: [
                    Expanded(
                      child: CardResume(
                        icon: Icons.people,
                        number: '1.234',
                        title: 'Usuarios',
                        variationText: '↑ 12%',
                        isPositive: true,
                        iconColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CardResume(
                        icon: Icons.euro,
                        number: '45.600',
                        title: 'Ingresos €',
                        variationText: '↓ 5%',
                        isPositive: false,
                        iconColor: Colors.yellow,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CardResume(
                        icon: Icons.trending_up,
                        number: '78%',
                        title: 'Conversión',
                        variationText: '↑ 23%',
                        isPositive: true,
                        iconColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                KeyedSubtree(
                  key: _keyDesempeno,
                  child: Text(
                    'Desempeño semanal',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.teal, thickness: 3),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(162, 238, 238, 238),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < datosGrafico.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        Builder(
                          builder: (context) {
                            final valor = datosGrafico[i] < 0
                                ? 0
                                : datosGrafico[i];
                            final color =
                                _coloresBarras[i % _coloresBarras.length];
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Text(
                                    diasSemana[i],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      final maxBarWidth =
                                          constraints.maxWidth - 36;
                                      return Row(
                                        children: [
                                          Container(
                                            height: 28,
                                            width: (valor / 100) * maxBarWidth,
                                            decoration: BoxDecoration(
                                              color: color,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                    topRight: Radius.circular(
                                                      6,
                                                    ),
                                                    bottomRight:
                                                        Radius.circular(6),
                                                  ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$valor%',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: color,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                KeyedSubtree(
                  key: _keyTransacciones,
                  child: Text(
                    'Últimas transacciones',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: Colors.teal, thickness: 3),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(83, 238, 238, 238),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: const BorderSide(
                          color: Colors.black12,
                          width: 1,
                        ), // líneas internas
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1.2),
                        1: FlexColumnWidth(2.2),
                        2: FlexColumnWidth(2.4),
                      },
                      children: [
                        // CABECERA (primera fila de color)
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.teal.shade200,
                          ),
                          children: const [
                            _Cell('ID', isHeader: true),
                            _Cell('Cantidad', isHeader: true),
                            _Cell('Estado', isHeader: true),
                          ],
                        ),
                        // Filas generadas desde la lista transacciones
                        ...transacciones.map((t) {
                          final estado = t['estado'] as String;
                          final estadoColor = estado == '✅ Completado'
                              ? Colors.green
                              : estado == '⏱ Pendiente'
                              ? Colors.orange
                              : Colors.red; // ✗ Cancelado
                          return TableRow(
                            children: [
                              _Cell(t['id'] as String),
                              _Cell(t['monto'] as String),
                              _Cell(
                                t['estado'] as String,
                                textColor: estadoColor,
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(color: Colors.teal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: Colors.white,
                onPressed: () => _scrollToSection(_keyMetricas),
              ),
              IconButton(
                icon: const Icon(Icons.bar_chart),
                color: Colors.white,
                onPressed: () => _scrollToSection(_keyDesempeno),
              ),
              IconButton(
                icon: const Icon(Icons.receipt),
                color: Colors.white,
                onPressed: () => _scrollToSection(_keyTransacciones),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final bool isHeader;
  final Color? textColor;

  const _Cell(this.text, {this.isHeader = false, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: textColor,
        ),
      ),
    );
  }
}
