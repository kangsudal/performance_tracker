import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    String str_addUpToFirst = '''
    int addUpToFirst(n) {
      var total = 0;
      for (var i = 0; i <= n; i++) {
        total += i;
      }
      return total;
    }
    ''';
    int addUpToFirst(n) {
      var total = 0;
      for (var i = 0; i <= n; i++) {
        total += i;
      }
      return total;
    }
    Duration duration = Duration(microseconds: 0);

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
                            Stopwatch stopwatch = new Stopwatch()..start();
                            addUpToFirst(10000000);
                            duration = stopwatch.elapsed;
                          });
                          print(
                              'addUpToFirst() executed in ${duration}');
                        },
                        child: Text("addUpToFirst"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("addUpToSecond"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(),
                          width: 50,
                          child: TextField()),
                      ElevatedButton(
                        onPressed: () {},
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
                                child: Text(str_addUpToFirst),
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
                      child: Text('$duration'),
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
