import 'package:flutter/material.dart';
import 'package:quiz/fimquiz.dart';

class Quiztela extends StatefulWidget {
  const Quiztela({super.key});

  @override
  _QuiztelaState createState() => _QuiztelaState();
}

class _QuiztelaState extends State<Quiztela> {
  List<Map<String, dynamic>> questoes = [
    {
      'questão': 'Qual é o maior planeta do Sistema Solar?',
      'Image':
          'assets/questao1.png',
      'opcoes': ['Marte', 'Terra', 'Júpiter', 'Saturno'],
      'Resposta Correta': 'Júpiter',
    },
    {
      'questão': 'Em que ano o homem pisou na Lua pela primeira vez?',
      'Image': 'assets/questao2.png',
      'opcoes': ['1965', '1969', '1972', '1975'],
      'Resposta Correta': '1969',
    },
    {
      'questão': 'Qual é o país mais populoso do mundo?',
      'Image':
          'assets/questao3.png',
      'opcoes': ['Índia', 'China', 'EUA', 'Indonésia'],
      'Resposta Correta': 'Índia',
    },
    {
      'questão': 'Qual elemento químico tem o símbolo H?',
      'Image':
          'assets/questao4.png',
      'opcoes': ['Helio', 'Hidrogênio', 'Ouro', 'Mercúrio'],
      'Resposta Correta': 'Hidrogênio',
    },
    {
      'questão': 'Quantos graus possui um ângulo reto?',
      'Image': 'assets/questao5.png',
      'opcoes': ['45', '90', '180', '360'],
      'Resposta Correta': '90',
    },
    {
      'questão': 'Quem pintou a Mona Lisa?',
      'Image':
          'assets/questao6.png',
      'opcoes': ['Michelangelo', 'Rafael', 'Van Gogh', 'Leonardo da Vinci'],
      'Resposta Correta': 'Leonardo da Vinci',
    },
    {
      'questão': 'Quantos segundos tem uma hora?',
      'Image':
          'assets/questao7.png',
      'opcoes': ['3.600', '1.200', '2.400', '6.000'],
      'Resposta Correta': '3.600',
    },
    {
      'questão': 'Qual é o país conhecido como a Terra do Sol Nascente?',
      'Image': 'assets/questao8.png',
      'opcoes': ['China', 'Japão', 'Coreia do Sul', 'Tailândia'],
      'Resposta Correta': 'Japão',
    },
    {
      'questão': 'Qual país é famoso pela Torre Eiffel?',
      'Image': 'assets/questao9.png',
      'opcoes': ['Espanha', 'Inglaterra', 'França', 'Itália'],
      'Resposta Correta': 'França',
    },
    {
      'questão': 'Qual animal é conhecido como o rei da selva?',
      'Image':
          'assets/questao10.png',
      'opcoes': ['Tigre', 'Leão', 'Elefante', 'Lobo'],
      'Resposta Correta': 'Leão',
    },
  ];

  int indicepergunta = 0;
  int perguntanumero = 1;
  int pontos = 0;
 late List<bool?> respostasCorretas;

  @override
  void initState() {
    super.initState();
    respostasCorretas = List<bool?>.filled(questoes.length, null);
  }

  void verificadorResposta(String resposta) {
    setState(() {
      if (resposta == questoes[indicepergunta]['Resposta Correta']) {
        if (respostasCorretas[indicepergunta] != true) {
          pontos++;
        }
        respostasCorretas[indicepergunta] = true;
      } else {
        if (respostasCorretas[indicepergunta] == true) {
          pontos--;
        }
        respostasCorretas[indicepergunta] = false;
      }
    });
  }

  void proximaquestao() {
    setState(() {
      if (indicepergunta < questoes.length - 1) {
        indicepergunta++;
        perguntanumero++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FimQuiz(pontos: pontos),
          ),
        );
      }
    });
  }

  void questaoanterior() {
    setState(() {
      if (indicepergunta > 0) {
        indicepergunta--;
        perguntanumero--;
      }
    });
  }

  void reiniciarquiz() {
    setState(() {
      indicepergunta = 0;
      perguntanumero = 1;
      pontos = 0;
      respostasCorretas = List<bool?>.filled(questoes.length, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: proximaquestao, icon: const Icon(Icons.arrow_forward))
        ],
        title: Text(
          ' Questão $perguntanumero',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        titleTextStyle: const TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(244, 8, 219, 209),
        leading: IconButton(onPressed: questaoanterior, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Image.asset(
                questoes[indicepergunta]['Image'],
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              questoes[indicepergunta]['questão'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ...questoes[indicepergunta]['opcoes'].map<Widget>((opcao) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () {
                  verificadorResposta(opcao);
                  proximaquestao();
                },
                child: Text(
                  opcao,
                  style: const TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
