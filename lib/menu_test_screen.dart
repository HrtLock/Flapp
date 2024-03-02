import 'package:flutter/material.dart';

class MenuTestScreen extends StatefulWidget {
  MenuTestScreen({Key? key}) : super(key: key);

  @override
  State<MenuTestScreen> createState() => _MenuTestScreenState();
}

class _MenuTestScreenState extends State<MenuTestScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Page1(),
    Page2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Суперопрос',
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.forest),
            label: 'Мишка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: 'Подсчёт медведей',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Тест пройден"),
          Image.network(
            'https://masyamba.ru/белый-медведь-картинки/77-белый-медведь.jpg',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Медведь ${index + 1}'),
        );
      },
    );
  }
}
