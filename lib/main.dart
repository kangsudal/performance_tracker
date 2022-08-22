import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:performance_tracker/model/subject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration duration = Duration(microseconds: 0);
  int _index = 0;

  List addUpToFirstResultList = [];
  List addUpToSecondResultList = [];

  @override
  Widget build(BuildContext context) {
    Subject subject = Subject();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Performance Tracker"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //노란색 container 속 텍스트 변화
                            _index = 0;
                          });
                        },
                        child: Text("addUpToFirst"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //노란색 container 속 텍스트 변화
                            _index = 1;
                          });
                        },
                        child: Text("addUpToSecond"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: () {
                          switch (_index) {
                            case 0:
                              //하얀색 Container 속 텍스트 변화
                              Stopwatch stopwatch = new Stopwatch()..start();
                              subject.addUpToFirst(10000000);
                              setState(() {
                                duration = stopwatch.elapsed;
                                addUpToFirstResultList.add(duration);
                              });
                              break;
                            case 1:
                              //하얀색 Container 속 텍스트 변화
                              Stopwatch stopwatch = new Stopwatch()..start();
                              subject.addUpToSecond(10000);
                              setState(() {
                                duration = stopwatch.elapsed;
                                addUpToSecondResultList.add(duration);
                              });
                              break;
                            default:
                              break;
                          }
                        },
                        child: Text('Plot!'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              // color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                color: Colors.yellow[100],
                                width: constraints.maxWidth * 0.9,
                                height: constraints.maxHeight * 0.5,
                                child: IndexedStack(
                                  index: _index,
                                  children: [
                                    Text(subject.str_addUpToFirst),
                                    Text(subject.str_addUpToSecond),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text('$duration'),
                          Text(addUpToFirstResultList.toString()),
                          Text(addUpToSecondResultList.toString()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
