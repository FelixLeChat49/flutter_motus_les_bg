import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/game/game_viewmodel.dart';
import 'package:flutter_motus/ui/widgets/grille.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameViewModel viewModel = context.read<GameViewModel>();
    // Créer des TextField avec un maxLength à 1
    //
    return GrilleWidget();
  }
}
