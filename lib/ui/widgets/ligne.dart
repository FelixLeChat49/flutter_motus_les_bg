import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/widgets/input_case.dart';

class LigneWidget extends StatefulWidget {
  const LigneWidget({
    Key? key,
    required this.word,
    this.enable = false
  }) : super(key: key);

  final String word;

  final bool enable;

  @override
  State<LigneWidget> createState() => _LigneWidgetState();
}

class _LigneWidgetState extends State<LigneWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> listeLettre = widget.word.split('');
    double tailleCase = (MediaQuery.of(context).size.width-15) /
        listeLettre.length;
    bool enableField = widget.enable;
    return Container(

      child: Row(
        children: [
          for (int i = 0; i < listeLettre.length; i++)
            if (i == 0)
              InputCase(lettre: listeLettre[i], size: tailleCase, enable: enableField,)
            else
              InputCase(size: tailleCase,enable: enableField,)
        ],
      ),
    );
  }
}
