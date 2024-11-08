import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/quiztela.dart';

class Telainicial extends StatelessWidget {
  const Telainicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Image.asset(
                  'assets/telainicialimagem.png',
                  fit: BoxFit.scaleDown,
                )),
            const Text(
              'ULTIMATE QUIZ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Quiztela()),
                );
              },
              child: const Text('JOGAR AGORA',
                  style: TextStyle(color: Color.fromARGB(251, 236, 236, 236))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('SAIR DO APP',
                  style: TextStyle(color: Color.fromARGB(251, 236, 236, 236))),
            ),
          ],
        ),
      ),
    );
  }
}
