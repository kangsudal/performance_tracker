import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:performance_tracker/model/subject.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProviderModel()),
      ],
      child: const MyApp(),
    ),
  );
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
  TextEditingController controller = TextEditingController();
  Subject subject = Subject();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //TOP
          Top(controller: controller, subject: subject),
          //BOTTOM
          Bottom(subject: subject),
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    Key? key,
    required this.controller,
    required this.subject,
  }) : super(key: key);

  final TextEditingController controller;
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Title
            Text("Performance Tracker"),
            //FunctionButtons
            FunctionButtons(),
            //InputContainer
            InputContainer(
              controller: controller,
              subject: subject,
            ),
          ],
        ),
      ),
      flex: 1,
    );
  }
}

class FunctionButtons extends StatelessWidget {
  FunctionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            //노란색 container 속 텍스트 변화
            context.read<MyProviderModel>().fetchIndex(0);
            // print(context.read<MyProviderModel>().index);
          },
          child: Text("addUpToFirst"),
        ),
        ElevatedButton(
          onPressed: () {
            //노란색 container 속 텍스트 변화
            context.read<MyProviderModel>().fetchIndex(1);
            // print(context.read<MyProviderModel>().index);
          },
          child: Text("addUpToSecond"),
        ),
      ],
    );
  }
}

class InputContainer extends StatelessWidget {
  InputContainer({Key? key, required this.controller, required this.subject})
      : super(key: key);

  TextEditingController controller;
  Subject subject;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Consumer<MyProviderModel>(
          builder: (_, myProviderModel, __) => ElevatedButton(
            onPressed: () {
              myProviderModel.fetchN(int.parse(controller.text));
              switch (context.read<MyProviderModel>().index) {
                case 0:
                  //하얀색 Container 속 텍스트 변화
                  Stopwatch stopwatch = new Stopwatch()..start();
                  subject.addUpToFirst(myProviderModel.n);
                  myProviderModel.fetchDuration(stopwatch.elapsed);
                  myProviderModel.updateAddUpToFirstResultList();
                  break;
                case 1:
                  //하얀색 Container 속 텍스트 변화
                  Stopwatch stopwatch = new Stopwatch()..start();
                  subject.addUpToSecond(myProviderModel.n);
                  myProviderModel.fetchDuration(stopwatch.elapsed);
                  myProviderModel.updateAddUpToSecondResultList();
                  break;
                default:
                  break;
              }
            },
            child: Text('Plot!'),
          ),
        ),
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.black,
        child: Row(
          children: [
            //BOTTOMLEFT
            BottomLeft(subject: subject),
            //BOTTOMRIGHT
            BottomRight(),
          ],
        ),
      ),
      flex: 2,
    );
  }
}

class BottomLeft extends StatelessWidget {
  const BottomLeft({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          //YELLOWBOX
          child: YellowBox(subject: subject),
        ),
      ),
    );
  }
}

class YellowBox extends StatelessWidget {
  const YellowBox({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.yellow[100],
            width: constraints.maxWidth * 0.9,
            height: constraints.maxHeight * 0.5,
            //CONTENTS
            child: Contents(subject: subject),
          );
        },
      ),
    );
  }
}

class Contents extends StatelessWidget {
  const Contents({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: context.watch<MyProviderModel>().index,
      children: [
        Text(subject.str_addUpToFirst),
        Text(subject.str_addUpToSecond),
      ],
    );
  }
}

class BottomRight extends StatelessWidget {
  const BottomRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text('n:${context.watch<MyProviderModel>().n}'),
            Text('duration:${context.watch<MyProviderModel>().duration}'),
            Text(context
                .watch<MyProviderModel>()
                .addUpToFirstResultList
                .toString()),
            Text(context
                .watch<MyProviderModel>()
                .addUpToSecondResultList
                .toString()),
          ],
        ),
      ),
    );
  }
}
