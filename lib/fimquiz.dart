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
    if (widget.pontos <= 2) {
      imagem = "assets/0-2.gif";
    }
    if (widget.pontos >= 3 && widget.pontos <= 5) {
      imagem = "assets/3-5.gif";
    }
    if (widget.pontos >= 6 && widget.pontos <= 8) {
      imagem = "assets/6-8.gif";
    }
    if (widget.pontos >= 9) {
      imagem = "assets/9-10.gif";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PONTUAÇÃO ${widget.pontos}/10',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        titleTextStyle:
            const TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(244, 3, 156, 149),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Image.asset(
                imagem,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'FIM DO QUIZ',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(251, 236, 236, 236)),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Telainicial()),
                );
              },
              child: const Text('REINICIAR QUIZ',
                  style: TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 25)),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(244, 3, 156, 149),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text('SAIR DO APP',
                  style: TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 25)),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Color(1),
    );
  }
}
