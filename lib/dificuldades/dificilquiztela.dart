import 'package:flutter/material.dart';
import 'package:quiz/fimquiz.dart';

class Dificilquiztela extends StatefulWidget {
  const Dificilquiztela({super.key});

  @override
  _DificilQuiztelaState createState() => _DificilQuiztelaState();
}

class _DificilQuiztelaState extends State<Dificilquiztela> {
  List<Map<String, dynamic>> questoes = [
    {
      'questão': 'Quem escreveu o épico “A Divina Comédia”?',
      'Image': 'assets/dificies/1.gif',
      'opcoes': ['Dante Alighieri', 'Homer', 'Virgílio', 'Shakespeare'],
      'Resposta Correta': 'Dante Alighieri',
    },
    {
      'questão': 'Qual cidade foi conhecida como Constantinopla no passado?',
      'Image': 'assets/dificies/2.gif',
      'opcoes': ['Roma', 'Atenas', 'Istambul', 'Cartago'],
      'Resposta Correta': 'Istambul',
    },
    {
      'questão': 'Qual artista pintou o teto da Capela Sistina?',
      'Image': 'assets/dificies/3.gif',
      'opcoes': ['Michelangelo', 'Leonardo da Vinci', 'Raphael', 'Donatello'],
      'Resposta Correta': 'Michelangelo',
    },
    {
      'questão': 'Qual evento histórico começou em 1789?',
      'Image': 'assets/dificies/4.gif',
      'opcoes': [
        'Revolução Americana',
        'Revolução Industrial',
        'Revolução Francesa',
        'Guerra dos Cem Anos'
      ],
      'Resposta Correta': 'Revolução Francesa',
    },
    {
      'questão': 'Qual poeta brasileiro é conhecido pela obra “Os Lusíadas”?',
      'Image': 'assets/dificies/5.gif',
      'opcoes': [
        'Carlos Drummond de Andrade',
        'Camões',
        'Machado de Assis',
        'Fernando Pessoa'
      ],
      'Resposta Correta': 'Camões',
    },
    {
      'questão': 'Qual foi a principal causa da Guerra dos Trinta Anos?',
      'Image': 'assets/dificies/6.gif',
      'opcoes': [
        'Conflitos religiosos entre católicos e protestantes',
        'Disputa comercial entre Inglaterra e França',
        'Expansão territorial da Espanha',
        'Revoltas camponesas na Alemanha'
      ],
      'Resposta Correta': 'Conflitos religiosos entre católicos e protestantes',
    },
    {
      'questão': 'Quem foi o último faraó do Egito?',
      'Image': 'assets/dificies/7.gif',
      'opcoes': ['Cleópatra', 'Ramsés II', 'Akhenaton', 'Tutancâmon'],
      'Resposta Correta': 'Cleópatra',
    },
    {
      'questão':
          'Qual é o nome do tratado que encerrou a Primeira Guerra Mundial?',
      'Image': 'assets/dificies/8.gif',
      'opcoes': [
        'Tratado de Versalhes',
        'Tratado de Tordesilhas',
        'Tratado de Paris',
        'Tratado de Utrecht'
      ],
      'Resposta Correta': 'Tratado de Versalhes',
    },
    {
      'questão': 'Qual país é conhecido como o berço da democracia?',
      'Image': 'assets/dificies/9.gif',
      'opcoes': ['Roma', 'Grécia', 'Egito', 'China'],
      'Resposta Correta': 'Grécia',
    },
    {
      'questão': 'Em qual país está localizado o Machu Picchu?',
      'Image': 'assets/dificies/10.gif',
      'opcoes': ['México', 'Peru', 'Bolívia', 'Chile'],
      'Resposta Correta': 'Peru',
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
          IconButton(
              onPressed: proximaquestao, icon: const Icon(Icons.arrow_forward))
        ],
        title: Text(
          ' Questão $perguntanumero',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        titleTextStyle:
            const TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(244, 3, 156, 149),
        leading: IconButton(
            onPressed: questaoanterior, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Image.asset(
                questoes[indicepergunta]['Image'],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  questoes[indicepergunta]['questão'],
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(244, 252, 252, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...questoes[indicepergunta]['opcoes'].map<Widget>((opcao) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(244, 3, 156, 149),
                ),
                onPressed: () {
                  verificadorResposta(opcao);
                  proximaquestao();
                },
                child: Text(
                  opcao,
                  style: const TextStyle(
                      color: Color.fromARGB(251, 236, 236, 236), fontSize: 25),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      backgroundColor: Color(1),
    );
  }
}
