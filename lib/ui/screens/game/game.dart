import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/game/game_viewmodel.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameViewModel viewModel = context.read<GameViewModel>();
    // Créer des TextField avec un maxLength à 1
    //
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Text(snapshot.data as String),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: viewModel.getRandomWord(),
    );
  }
}
