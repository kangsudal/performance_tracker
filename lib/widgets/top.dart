import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:performance_tracker/model/subject.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

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
          style: ElevatedButton.styleFrom(primary: Colors.yellow),
        ),
        ElevatedButton(
          onPressed: () {
            //노란색 container 속 텍스트 변화
            context.read<MyProviderModel>().fetchIndex(1);
            // print(context.read<MyProviderModel>().index);
          },
          child: Text("addUpToSecond"),
          style: ElevatedButton.styleFrom(primary: Colors.cyan),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<MyProviderModel>().clearChart();
          },
          child: Text("clear chart"),
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
              if (controller.text.isEmpty) {
                controller.text = '0';
              }
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
