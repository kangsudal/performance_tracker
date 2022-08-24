
import 'package:flutter/material.dart';
import 'package:performance_tracker/model/subject.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

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