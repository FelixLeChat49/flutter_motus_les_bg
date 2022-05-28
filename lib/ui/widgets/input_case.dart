import 'package:flutter/material.dart';

class InputCase extends StatelessWidget {
  const InputCase(
      {Key? key,
      this.etatLettre = EtatLettre.VIDE,
      this.lettre = "",
      required this.size,
      required this.enable})
      : super(key: key);

  final EtatLettre etatLettre;

  final String lettre;

  final double size;

  final bool enable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // A mettre dans la column
      width: size,
      child: TextFormField(
        enabled: enable,
        maxLength: 1,
        onChanged: (text) {
          if (text.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        initialValue: lettre,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 25),
        decoration: (!enable) ?
        const InputDecoration(
          counterText: "",
          fillColor: Colors.grey,
          filled: true,
        ) :
        const InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
        )
      ),
    );
  }
}

enum EtatLettre { VIDE, REMPLI, MAUVAISEPLACE, BONNEPLACE }
