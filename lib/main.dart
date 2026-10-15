import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ListPage()));
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // Көп элементті сақтайтын тізім
  final List<String> _names = ['Айдар', 'Дана', 'Ерлан', 'Мөлдір', 'Нұрлан'];

  void _addName() {
    setState(() {
      _names.add('Жаңа дос ${_names.length + 1}');
    });
  }

  void _removeAt(int index) {
    setState(() {
      _names.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Достарым (${_names.length})')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addName,
        child: const Icon(Icons.add),
      ),
      body: _names.isEmpty
          ? const Center(child: Text('Тізім бос. + батырмасын басыңыз.'))
          : ListView.builder(
              itemCount: _names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text(_names[index][0])),
                  title: Text(_names[index]),
                  subtitle: Text('Нөмір: ${index + 1}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeAt(index),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Сіз ${_names[index]} таңдадыңыз'),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
