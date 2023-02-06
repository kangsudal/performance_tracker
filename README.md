
![image](https://user-images.githubusercontent.com/32862869/187009639-64d99dab-2fdb-4933-b4de-50975acaf4d0.png)  
0~n까지 합을 구하는 두가지 방식 비교  
O(1)과 O(n) 시각화 그래프  
https://kangsudal.tistory.com/entry/Performance-Tracker

# Performance Tracker

### Big O 표기법
코드의 성능을 평가하여 숫자로 표기하는 방법

**목표**: 0~n까지 합을 구하는 두가지 방식을 비교, 시간복잡도 시각화하기(함수가 실행되는데 걸리는 시간과 전체적인 추세를 그래프로 보여줌)

**비교 코드**
<br/>
O(n)

```
  int addUpToFirst(int n) {
    var total = 0;
    for (var i = 0; i <= n; i++) {
      total += i;
    }
    return total;
  }
```
<br/>

O(1)
```
  int addUpToSecond(int n) {
    return (n * (n + 1) / 2).toInt();
  }
```

첫번째 코드는 for loop로 인해 n에따라 연산의 개수가 n에 수렴한다. 두번째 코드는 n이 아무리 커져도 연산이 3번밖에 일어나지 않는다. 그러므로 상수에 수렴한다.
<br/>
<br/>

### 사용 라이브러리와 주요 함수
**사용 라이브러리**: `provider`, `fl_chart`

`provider`: 사용자가 입력한 n 값, 함수 실행하는데 걸린 duration을 List<FlSpot>에 추가하고 관리함

`fl_chart`: Line Chart 사용

**주요 함수**: Stopwatch()..start()

```
          Stopwatch stopwatch = new Stopwatch()..start();
          subject.addUpToFirst(myProviderModel.n);
          myProviderModel.fetchDuration(stopwatch.elapsed);
```

### 도움받은 글 & 영상
시간측정: https://stackoverflow.com/questions/16955157/dart-is-there-a-way-to-measure-execution-time-for-a-small-code/16955257
<br/>
그래프: https://youtu.be/eCCFQm83D6M?t=342
<br/>
Big O 개념: https://www.udemy.com/course/best-javascript-data-structures/
