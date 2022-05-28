import 'package:flutter/material.dart';

import 'ligne.dart';

class GrilleWidget extends StatefulWidget {
  const GrilleWidget({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  State<GrilleWidget> createState() => _GrilleWidgetState();
}

class _GrilleWidgetState extends State<GrilleWidget> {
  int enableRow = 0;

  bool buttonEnabled = true;
  
  void changeRow(){
    setState((){
      enableRow++;
      if(enableRow >=5){
        buttonEnabled = false;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    String word = widget.word;
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF0E7CFF), width: 2),
        borderRadius:const  BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          for(int i=0; i<5; i++) if(i==enableRow)LigneWidget(word: word,enable:true) else LigneWidget(word: word),
          ElevatedButton(
              onPressed: (buttonEnabled) ? changeRow : null,

              child: const Text("Valider la réponse")
          )
        ],
      ),
    );
  }
}
