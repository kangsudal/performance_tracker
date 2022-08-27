import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

class BottomRight extends StatelessWidget {
  const BottomRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: leftTitleWidgets,
                        ),
                      ),
                    ),
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

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
      // color: Color(0xff75729e),
      // fontWeight: FontWeight.bold,
      // fontSize: 14,
      );
  String text = value.toString();
  text = text + 'µs';

  return FittedBox(child: Text(text, style: style, textAlign: TextAlign.center),fit: BoxFit.fitWidth,);
}
