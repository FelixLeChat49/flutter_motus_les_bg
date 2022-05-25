import 'package:flutter/material.dart';

import 'ligne.dart';

class GrilleWidget extends StatefulWidget {
  const GrilleWidget({Key? key}) : super(key: key);

  @override
  State<GrilleWidget> createState() => _GrilleWidgetState();
}

class _GrilleWidgetState extends State<GrilleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF0E7CFF), width: 2),
        borderRadius:const  BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          for(int i=0; i<5; i++) if(i == 0) LigneWidget(word: 'bonjour')
        ],
      ),
    );
  }
}
