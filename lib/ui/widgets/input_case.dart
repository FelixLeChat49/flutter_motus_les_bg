import 'package:flutter/material.dart';

class InputCase extends StatelessWidget {
  const InputCase(
      {Key? key, this.etatLettre = EtatLettre.VIDE, this.lettre = ""})
      : super(key: key);

  final EtatLettre etatLettre;

  final String lettre;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // A mettre dans la column
      width: MediaQuery.of(context).size.width / 5,
      child: const TextField(
        maxLength: 1,
        style: TextStyle(
          color: Colors.blue
        ),
      ),
    );
  }
}

enum EtatLettre { VIDE, REMPLI, MAUVAISEPLACE, BONNEPLACE }
