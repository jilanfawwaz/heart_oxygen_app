import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeDiagram extends StatefulWidget {
  const HomeDiagram({super.key});
  static const nameRoute = '/homediagram';

  @override
  State<HomeDiagram> createState() => _HomeDiagramState();
}

class _HomeDiagramState extends State<HomeDiagram> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<int> historyHeartRate =
        ModalRoute.of(context)?.settings.arguments as List<int>;
    int i = 0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Laporan Heart Rate Anda'),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: historyHeartRate.length + 1,
                  minY: 30,
                  maxY: 120,
                  rangeAnnotations:
                      RangeAnnotations(horizontalRangeAnnotations: [
                    HorizontalRangeAnnotation(
                      y1: 30,
                      y2: 60,
                      color: Colors.redAccent,
                    ),
                    HorizontalRangeAnnotation(
                      y1: 100,
                      y2: 120,
                      color: Colors.redAccent,
                    )
                  ]),
                  gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.blueAccent,
                          strokeWidth: 1,
                        );
                      }),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        for (final item in historyHeartRate)
                          FlSpot((i++).toDouble(), item.toDouble()),
                      ],
                      isCurved: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
