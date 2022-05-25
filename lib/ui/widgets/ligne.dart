import 'package:flutter/material.dart';

class LigneWidget extends StatefulWidget {
  const LigneWidget({
    Key? key,
    required this.word,
  }) : super(key: key);

  final String word;

  @override
  State<LigneWidget> createState() => _LigneWidgetState();
}

class _LigneWidgetState extends State<LigneWidget> {

  @override
  Widget build(BuildContext context) {
    List<String> listeLettre = widget.word.split('');

    return Container(
      child: Row(
        children: [
          for(int i=0; i<listeLettre.length; i++) if(i == 0) Text(listeLettre[i]) else Text('/')
        ],
      ),
    );
  }
}
