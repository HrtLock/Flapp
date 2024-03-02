import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroTestScreen extends StatefulWidget {
  IntroTestScreen({Key? key}) : super(key: key);

  @override
  State<IntroTestScreen> createState() => _IntroTestScreenState();
}

class _IntroTestScreenState extends State<IntroTestScreen> {
  int _score = 0;
  bool _answered = false;

  void _checkAnswer(bool answer) {
    if (answer) {
      setState(() {
        _score = 1;
      });
    }
    setState(() {
      _answered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFDFF0FF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Супреопрос',
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            constraints: BoxConstraints(minHeight: 30, maxWidth: 500),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.indigo.shade800,
                    Colors.indigo.shade900,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(2, 4),
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Вопрос: Какой язык программирования используется для разработки приложений на Android?',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(true);
                        },
                        child: Text('Java'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(false);
                        },
                        child: Text('Kotlin'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(false);
                        },
                        child: Text('Swift'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _checkAnswer(false);
                        },
                        child: Text('Objective-C'),
                      ),
                    ),
                  ],
                ),
                if (_answered)
                  Text(
                    _score == 1 ? 'Правильно!' : 'Неправильно, выбирай ещё.',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),

                if(_score == 1) SizedBox(height: 20),
                if(_score == 1) ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/menuTestScreen");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Далее',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
