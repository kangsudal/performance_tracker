import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

class BottomRight extends StatelessWidget {
  const BottomRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              flex: 5,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                        color: Colors.yellow,
                        spots: (context
                            .watch<MyProviderModel>()
                            .addUpToFirstResultList)),
                    LineChartBarData(
                        spots: (context
                            .watch<MyProviderModel>()
                            .addUpToSecondResultList)),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    // leftTitles: SideTitles(
                    //   interval: 0.5,
                    //   reservedSize: 30,
                    //   showTitles: true,
                    //   getTitles: (value) {
                    //     return value.toStringAsFixed(1).toString();
                    //   },
                    // ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
