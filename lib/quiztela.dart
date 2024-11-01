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
      'ImageUrl':
          'https://img.odcdn.com.br/wp-content/uploads/2021/09/shutterstock_311871896.jpg',
      'opcoes': ['Marte', 'Terra', 'Júpiter', 'Saturno'],
      'Resposta Correta': 'Júpiter',
    },
    {
      'questão': 'Em que continente fica o Brasil?',
      'ImageUrl':
          'https://static.todamateria.com.br/upload/ma/pa/mapa-mundi-og.jpg',
      'opcoes': ['Europa', 'África', 'América do Sul', 'Ásia'],
      'Resposta Correta': 'América do Sul',
    },
    {
      'questão': 'Qual é o país mais populoso do mundo?',
      'ImageUrl':
          'https://thumbs.dreamstime.com/b/muitas-pessoas-andando-na-rua-esta-foto-retrata-uma-movimentada-cena-de-com-caminhando-em-dire%C3%A7%C3%B5es-diferentes-imagem-capta-275780710.jpg',
      'opcoes': ['Índia', 'China', 'EUA', 'Indonésia'],
      'Resposta Correta': 'Índia',
    },
    {
      'questão': 'Qual elemento químico tem o símbolo H?',
      'ImageUrl':
          'https://acdn.mitiendanube.com/stores/241/323/products/cubo-magico-4x4x4-elementos-quimicos-tabela-periodica-stickerless-casa-do-cubo-4-dd77996c48652b439f17026724756245-1024-1024.jpg',
      'opcoes': ['Helio', 'Hidrogênio', 'Ouro', 'Mercúrio'],
      'Resposta Correta': 'Hidrogênio',
    },
    {
      'questão': 'Qual é o idioma mais falado no mundo?',
      'ImageUrl':
          'https://i0.wp.com/cms.babbel.news/wp-content/uploads/2016/12/World_06.jpg?resize=700%2C394&strip=none&ssl=1',
      'opcoes': ['Inglês', 'Espanhol', 'Mandarim', 'Hindu'],
      'Resposta Correta': 'Mandarim',
    },
    {
      'questão': 'Quem pintou a Mona Lisa?',
      'ImageUrl':
          'https://cdn.britannica.com/24/189624-050-F3C5BAA9/Mona-Lisa-oil-wood-panel-Leonardo-da.jpg?w=400&h=300&c=crop',
      'opcoes': ['Michelangelo', 'Rafael', 'Van Gogh', 'Leonardo da Vinci'],
      'Resposta Correta': 'Leonardo da Vinci',
    },
    {
      'questão': 'Quantos segundos tem uma hora?',
      'ImageUrl':
          'https://quadrimark.com.br/wp-content/uploads/2018/07/Gerenciamento-de-tempo.png',
      'opcoes': ['3.600', '1.200', '2.400', '6.000'],
      'Resposta Correta': '3.600',
    },
    {
      'questão': 'Qual é o maior oceano do mundo?',
      'ImageUrl':
          'https://dinamicambiental.com.br/wp-content/uploads/2021/06/o-oceano-e-a-nossa-sobrevivencia.jpg',
      'opcoes': ['Atlântico', 'Índico', 'Pacífico', 'Ártico'],
      'Resposta Correta': 'Pacífico',
    },
    {
      'questão': 'Qual país é famoso pela Torre Eiffel?',
      'ImageUrl': 'https://imgmd.net/images/v1/guia/1704562/torre-eiffel.jpg',
      'opcoes': ['Espanha', 'Inglaterra', 'França', 'Itália'],
      'Resposta Correta': 'França',
    },
    {
      'questão': 'Qual animal é conhecido como o rei da selva?',
      'ImageUrl':
          'https://i.pinimg.com/736x/25/b4/31/25b431462414732fe9a111daf983b6c6.jpg',
      'opcoes': ['Tigre', 'Leão', 'Elefante', 'Lobo'],
      'Resposta Correta': 'Leão',
    },
  ];
  int indicepergunta = 0;
  int perguntanumero = 1;
  int pontos = 0;

  void verificadorResposta(String resposta) {
    setState(() {
      if (resposta == questoes[indicepergunta]['Resposta Correta']) {
        pontos++;
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
      indicepergunta--;
      perguntanumero--;
      pontos--;
    });
  }

  void reiniciarquiz() {
    setState(() {
      indicepergunta = 0;
      perguntanumero = 0;
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
        backgroundColor: const Color.fromARGB(244, 8, 219, 209),
        leading: IconButton(
            onPressed: questaoanterior, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Image.network(
                questoes[indicepergunta]['ImageUrl'],
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
