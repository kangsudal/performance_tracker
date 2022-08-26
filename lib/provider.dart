import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyProviderModel with ChangeNotifier {
  int n = 0;
  Duration duration = Duration();
  double get seconds => duration.inMicroseconds.toDouble();
  //n에 따라 addUpToFirst(int n) 실행하는데 걸린 duration 집합
  List<FlSpot> addUpToFirstResultList = [FlSpot(0, 0)];
  //n에 따라 addUpToSecond(int n) 실행하는데 걸린 duration 집합
  List<FlSpot> addUpToSecondResultList = [FlSpot(0, 0)];
  int index = 0;

  //함수 입력값 업데이트
  void fetchN(int value) {
    n = value;
    notifyListeners();
  }

  //함수가 끝나는 시간 업데이트
  void fetchDuration(Duration end) {
    duration = end;
    notifyListeners();
  }

  //n에 따라 addUpToFirst(int n) 실행하는데 걸린 duration 추가
  void updateAddUpToFirstResultList() {
    FlSpot item = FlSpot(n.toDouble(), seconds);
    addUpToFirstResultList.add(item);
    addUpToFirstResultList.sort((a, b) => a.x.compareTo(b.x));
    notifyListeners();
  }

  //n에 따라 addUpToSecond(int n) 실행하는데 걸린 duration 추가
  void updateAddUpToSecondResultList() {
    FlSpot item = FlSpot(n.toDouble(), seconds);
    addUpToSecondResultList.add(item);
    addUpToSecondResultList.sort((a, b) => a.x.compareTo(b.x));
    notifyListeners();
  }

  void fetchIndex(int i) {
    index = i;
    notifyListeners();
  }
}
