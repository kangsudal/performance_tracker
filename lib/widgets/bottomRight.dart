import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

class BottomRight extends StatelessWidget {
  const BottomRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FlSpot> _lineData = [
      // FlSpot(n, duration)
      FlSpot(0, 0.0001),
      FlSpot(500, 0.0001),
      FlSpot(1000, 0.01),
      FlSpot(1500, 5),
      FlSpot(2000, 100),
      FlSpot(2500, 50),
    ];
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Text('n:${context.watch<MyProviderModel>().n}'),
            ),
            Expanded(
              child:
                  Text('duration:${context.watch<MyProviderModel>().duration}'),
            ),
            Expanded(
              child: Text(
                context
                    .watch<MyProviderModel>()
                    .addUpToFirstResultList
                    .toString(),
              ),
            ),
            Expanded(
              child: Text(
                context
                    .watch<MyProviderModel>()
                    .addUpToSecondResultList
                    .toString(),
              ),
            ),
            Expanded(
              flex: 20,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(spots: _lineData),
                  ], // read about it in the LineChartData section
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
