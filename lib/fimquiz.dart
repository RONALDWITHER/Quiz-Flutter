import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/telainicial.dart';

class FimQuiz extends StatelessWidget {
  final int pontos;

  const FimQuiz({super.key, required this.pontos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' PONTUAÇÃO $pontos/10',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        titleTextStyle:
            const TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(244, 8, 219, 209),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'PONTUAÇÃO $pontos',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
                flex: 3,
                child: Image.network(
                  'https://img.freepik.com/fotos-premium/ai-gerou-ilustracao-de-humano-com-enorme-cerebro-gigante_441362-5569.jpg',
                  fit: BoxFit.scaleDown,
                )),
            const Text(
              'FIM DO QUIZ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Telainicial()),
                );
              },
              child: const Text('REINICIAR QUIZ',
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
