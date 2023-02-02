import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeDiagram extends StatelessWidget {
  const HomeDiagram({super.key});
  static const nameRoute = '/homediagram';

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
              height: 500,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: historyHeartRate.length + 1,
                  minY: 0,
                  maxY: 120,
                  rangeAnnotations:
                      RangeAnnotations(horizontalRangeAnnotations: [
                    HorizontalRangeAnnotation(
                      y1: 0,
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
