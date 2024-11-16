import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/teladificuldade.dart';

class Telainicial extends StatelessWidget {
  const Telainicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/imageinicial.gif',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 100),
            const Text(
              'ULTIMATE QUIZ',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(240, 234, 234, 236)),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Desafie seus conhecimentos!',
                style: TextStyle(
                  color: Color.fromARGB(188, 175, 171, 171),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Teladificuldade()),
                );
              },
              child: const Text('JOGAR AGORA',
                  style: TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 20)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('SAIR DO APP',
                  style: TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 20)),
            ),
          ],
        ),
      ),
      backgroundColor: Color(1),
    );
  }
}
