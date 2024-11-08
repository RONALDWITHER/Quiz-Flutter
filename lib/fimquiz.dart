import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/telainicial.dart';

class FimQuiz extends StatefulWidget {
  final int pontos;

  const FimQuiz({super.key, required this.pontos});

  @override
  _FimQuizState createState() => _FimQuizState();
}

class _FimQuizState extends State<FimQuiz> {
  late String imagem;

  @override
  void initState() {
    super.initState();
    imagefinal();
  }

  void imagefinal() {
    if (widget.pontos < 2) {
      imagem = "assets/0a2.png";
    }else{
      imagem = "assets/3a5.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PONTUAÇÃO ${widget.pontos}/10',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        titleTextStyle: const TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(244, 8, 219, 209),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'PONTUAÇÃO ${widget.pontos}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                imagem,
                fit: BoxFit.scaleDown,
              ),
            ),
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
