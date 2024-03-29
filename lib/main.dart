import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLAP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String photoUrl = "https://sun9-21.userapi.com/impg/wTbSz3qf8l8L-ipwSSVTbg6Iyvk8ZRsLtP16Kg/EJ46-QANIWU.jpg?size=2560x1707&quality=95&sign=827855941fd3f8eee2c3a4ebca0e0d6f&type=album";
  final String fio = "Калинин Александр\nВасильевич";
  final String employeeNumber = "БСБО-11-22";
  final String employeeCode = "22Б0662";


  DateTime now = DateTime.now();



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFDFF0FF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Страничка',
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
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
                borderRadius: BorderRadius.circular(16.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    photoUrl,
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  fio,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Группа",
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Text(
                  employeeNumber,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                Divider(
                  color: Colors.white,
                  indent: 100,
                  endIndent: 100,
                ),
                Text(
                  "Номер студенческого билета",
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Text(
                  employeeCode,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
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
