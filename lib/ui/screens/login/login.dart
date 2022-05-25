import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E7CFF),
      body: Consumer<LoginViewModel>(
        builder: ((context, viewModel, child) {
          viewModel.addListener(() {
            if (viewModel.user != null) {
              context.beamToNamed("/home");
            }
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width / 10,
                child: const Card(
                  color: Colors.deepOrange,
                  elevation: 5,
                  child: Text(
                    'Mot de passe incorrect',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    TextField(
                      obscureText: false,
                      controller: loginController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Login',
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Password',
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.signIn(
                              email: loginController.value.text,
                              password: passwordController.value.text);
                        },
                        child: const Text('Se connecter')),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
