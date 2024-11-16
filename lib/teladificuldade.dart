import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/dificuldades/dificilquiztela.dart';
import 'package:quiz/dificuldades/facilquiztela.dart';
import 'package:quiz/dificuldades/medioquiztela.dart';

class Teladificuldade extends StatelessWidget {
  const Teladificuldade({super.key});

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
                  fit: BoxFit.scaleDown,
                )),
            const SizedBox(height: 100),
            const Text(
              'DIFICULDADE',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(240, 234, 234, 236)),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FacilQuiztela()),
                );
              },
              child: const Text('FÁCIL',
                  style: TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 20)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MedioQuiztela()),
                );
              },
              child: const Text('MÉDIO',
                  style: TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 20)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Dificilquiztela()),
                );
              },
              child: const Text('DÍFICIL',
                  style: TextStyle(
                      color: Color.fromARGB(250, 235, 231, 231), fontSize: 20)),
            ),
            const SizedBox(height: 50),
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
