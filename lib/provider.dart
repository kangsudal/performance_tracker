import 'package:flutter/material.dart';

class MyProviderModel with ChangeNotifier {
  int n = 0;
  Duration duration = Duration();
  //n에 따라 addUpToFirst(int n) 실행하는데 걸린 duration 집합
  List addUpToFirstResultList = [];
  //n에 따라 addUpToSecond(int n) 실행하는데 걸린 duration 집합
  List addUpToSecondResultList = [];
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
    addUpToFirstResultList.add(duration);
    notifyListeners();
  }

  //n에 따라 addUpToSecond(int n) 실행하는데 걸린 duration 추가
  void updateAddUpToSecondResultList() {
    addUpToSecondResultList.add(duration);
    notifyListeners();
  }

  void fetchIndex(int i){
    index = i;
    notifyListeners();
  }
}
