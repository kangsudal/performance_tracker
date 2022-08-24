import 'package:flutter/material.dart';
import 'package:performance_tracker/model/subject.dart';
import 'package:performance_tracker/provider.dart';
import 'package:performance_tracker/widgets/bottomLeft.dart';
import 'package:performance_tracker/widgets/bottomRight.dart';
import 'package:performance_tracker/widgets/top.dart';
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
  TextEditingController controller = TextEditingController(text: '0');
  Subject subject = Subject();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
