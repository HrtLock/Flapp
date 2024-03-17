import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    Page3(),
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
            icon: Icon(Icons.view_column),
            label: 'Widget-е Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Widget-е ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Widget-е ListView.separated',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void addItem() {
    setState(() {
      items.add('New Item');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: addItem,
          child: Text('Add Item'),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items
                  .map(
                    (item) => ListTile(
                      title: Text(items[items.indexOf(item)]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeItem(
                          items.indexOf(item),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void addItem() {
    setState(() {
      items.add('New Item');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: addItem,
          child: Text('Add Item'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeItem(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Page3 extends StatefulWidget {
  Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void addItem() {
    setState(() {
      items.add('New Item');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: addItem,
          child: Text('Add Item'),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeItem(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
