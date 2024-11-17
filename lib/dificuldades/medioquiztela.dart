import 'package:flutter/material.dart';
import 'package:quiz/fimquiz.dart';

class MedioQuiztela extends StatefulWidget {
  const MedioQuiztela({super.key});

  @override
  _MedioQuiztelaState createState() => _MedioQuiztelaState();
}

class _MedioQuiztelaState extends State<MedioQuiztela> {
  List<Map<String, dynamic>> questoes = [
    {
      'questão':
          'Qual foi o primeiro elemento químico a ser sintetizado artificialmente?',
      'Image': 'assets/medias/1.gif',
      'opcoes': ['Urânio', 'Técnécio', 'Plutônio', 'Rádio'],
      'Resposta Correta': 'Técnécio',
    },
    {
      'questão':
          'Qual é a única obra completa de Ludwig van Beethoven que tem um texto cantado?',
      'Image': 'assets/medias/2.gif',
      'opcoes': ['Sinfonia nº 5', 'Sinfonia nº 9', 'Fidelio', 'Sonata ao Luar'],
      'Resposta Correta': 'Sinfonia nº 9',
    },
    {
      'questão':
          'Em que país ocorreu a Revolução Meiji?',
      'Image': 'assets/medias/3.gif',
      'opcoes': ['China', 'Coreia do Sul', 'Japão', 'Tailândia'],
      'Resposta Correta': 'Japão',
    },
    {
      'questão':
          'Qual filósofo escreveu "Ser e Tempo"?',
      'Image': 'assets/medias/4.gif',
      'opcoes': [
        'Jean-Paul Sartre',
        'Martin Heidegger',
        'Simone de Beauvoir',
        'Friedrich Nietzsche'
      ],
      'Resposta Correta': 'Martin Heidegger',
    },
    {
      'questão':
          'Qual é a partícula responsável pela força forte que mantém os núcleos?',
      'Image': 'assets/medias/5.gif',
      'opcoes': ['Fóton', 'Bóson de Higgs', 'Glúon', 'Neutrino'],
      'Resposta Correta': 'Glúon',
    },
    {
      'questão': 'Quem propôs pela primeira vez a teoria heliocêntrica?',
      'Image': 'assets/medias/6.gif',
      'opcoes': ['Copérnico', 'Galileu', 'Kepler', 'Newton'],
      'Resposta Correta': 'Copérnico',
    },
    {
      'questão':
          'Qual é o valor da constante gravitacional (G) em unidades SI?',
      'Image': 'assets/medias/7.gif',
      'opcoes': ['6,67 x 10^-11', '9,81', '1,6 x 10^-19', '3 × 10^8'],
      'Resposta Correta': '6,67 x 10^-11',
    },
    {
      'questão':
          'Em que ano foi escrito o "Manifesto Comunista" por Marx e Engels?',
      'Image': 'assets/medias/8.gif',
      'opcoes': ['1848', '1917', '1871', '1789'],
      'Resposta Correta': '1848',
    },
    {
      'questão':
          'Qual animal é considerado o mais antigo da Terra ainda existente?',
      'Image': 'assets/medias/9.gif',
      'opcoes': [
        'Tubarão da Gronelândia',
        'Medusa Imortal',
        'Crocodilo',
        'Nautilus'
      ],
      'Resposta Correta': 'Tubarão da Gronelândia',
    },
    {
      'questão':
          'Qual a distância média entre a Terra e o Sol, em milhões de quilômetros?',
      'Image': 'assets/medias/10.gif',
      'opcoes': ['93', '150', '200', '250'],
      'Resposta Correta': '150',
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
