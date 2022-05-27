import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/game/game_viewmodel.dart';
import 'package:flutter_motus/ui/widgets/grille.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameViewModel viewModel = context.read<GameViewModel>();
    return FutureBuilder(
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
        return GrilleWidget(word: snapshot.data.toString(),);
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: viewModel.getRandomWord()
    );
  }
}
