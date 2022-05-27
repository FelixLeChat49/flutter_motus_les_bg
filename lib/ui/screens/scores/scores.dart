import 'package:flutter/material.dart';

class ScoresPage extends StatelessWidget {
  const ScoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Scores Page"),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 20,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text('Item at $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
