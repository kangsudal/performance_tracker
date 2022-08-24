
import 'package:flutter/material.dart';
import 'package:performance_tracker/provider.dart';
import 'package:provider/provider.dart';

class BottomRight extends StatelessWidget {
  const BottomRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          ],
        ),
      ),
    );
  }
}
