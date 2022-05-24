import 'package:flutter/material.dart';
import 'package:flutter_motus/data/entities/game.dart';
import 'package:flutter_motus/data/entities/trash.dart';
import 'package:flutter_motus/data/entities/user.dart';
import 'package:flutter_motus/data/entities/word.dart';
import 'package:flutter_motus/ui/my_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
//   await Hive.initFlutter();
//   Hive..registerAdapter(WordAdapter())
//   ..registerAdapter(GameAdapter())
//   ..registerAdapter(UserAdapter())
//   ..registerAdapter(TrashAdapter());
//   runApp(MultiProvider(providers: [
//     // ChangeNotifierProvider(create: (_)=>GameViewModel()),
//     // ChangeNotifierProvider(create: (_)=>LoginViewModel()),
//     // ChangeNotifierProvider(create: (_)=>ProfileViewModel()),
//     // ChangeNotifierProvider(create: (_)=>ScoresViewModelViewModel()),
//   ],
//   child: const MyApp(),)
//   );
// }

void main() => runApp(const MyApp());




