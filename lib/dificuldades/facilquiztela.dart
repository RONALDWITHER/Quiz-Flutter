import 'package:flutter/material.dart';
import 'package:quiz/fimquiz.dart';

class FacilQuiztela extends StatefulWidget {
  const FacilQuiztela({super.key});

  @override
  _FacilQuiztelaState createState() => _FacilQuiztelaState();
}

class _FacilQuiztelaState extends State<FacilQuiztela> {
  List<Map<String, dynamic>> questoes = [
    {
      'questão': 'Qual é o maior planeta do Sistema Solar?',
      'Image': 'assets/faceis/1.gif',
      'opcoes': ['Marte', 'Terra', 'Júpiter', 'Saturno'],
      'Resposta Correta': 'Júpiter',
    },
    {
      'questão': 'Em que ano o homem pisou na Lua pela primeira vez?',
      'Image': 'assets/faceis/2.gif',
      'opcoes': ['1965', '1969', '1972', '1975'],
      'Resposta Correta': '1969',
    },
    {
      'questão': 'Qual é o país mais populoso do mundo?',
      'Image': 'assets/faceis/3.gif',
      'opcoes': ['Índia', 'China', 'EUA', 'Indonésia'],
      'Resposta Correta': 'Índia',
    },
    {
      'questão': 'Qual elemento químico tem o símbolo H?',
      'Image': 'assets/faceis/4.gif',
      'opcoes': ['Helio', 'Hidrogênio', 'Ouro', 'Mercúrio'],
      'Resposta Correta': 'Hidrogênio',
    },
    {
      'questão': 'Quantos graus possui um ângulo reto?',
      'Image': 'assets/faceis/5.gif',
      'opcoes': ['45', '90', '180', '360'],
      'Resposta Correta': '90',
    },
    {
      'questão': 'Quem pintou a Mona Lisa?',
      'Image': 'assets/faceis/6.gif',
      'opcoes': ['Michelangelo', 'Rafael', 'Van Gogh', 'Leonardo da Vinci'],
      'Resposta Correta': 'Leonardo da Vinci',
    },
    {
      'questão': 'Quantos segundos tem uma hora?',
      'Image': 'assets/faceis/7.gif',
      'opcoes': ['3.600', '1.200', '2.400', '6.000'],
      'Resposta Correta': '3.600',
    },
    {
      'questão': 'Qual é o país conhecido como a Terra do Sol Nascente?',
      'Image': 'assets/faceis/8.gif',
      'opcoes': ['China', 'Japão', 'Coreia do Sul', 'Tailândia'],
      'Resposta Correta': 'Japão',
    },
    {
      'questão': 'Qual país é famoso pela Torre Eiffel?',
      'Image': 'assets/faceis/9.gif',
      'opcoes': ['Espanha', 'Inglaterra', 'França', 'Itália'],
      'Resposta Correta': 'França',
    },
    {
      'questão': 'Qual animal é conhecido como o rei da selva?',
      'Image': 'assets/faceis/10.gif',
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
              //A função 'map' percorre cada item de uma lista e transforma esses itens em novos objetos. 
              //Usei ela pra converter todas as opções em 'ElevatedButton'
              //O 'toList()' é usado no pra transformar o resultado em uma lista de widgets.
          ],
        ),
      ),
      backgroundColor: Color(1),
    );
  }
}
