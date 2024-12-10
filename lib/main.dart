import 'package:curso/entities/todo_item.entity.dart';
import 'package:curso/widgets/todo_item.widget.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Curso Flutter EMERON'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  List<TodoItemEntity> task = [
    TodoItemEntity(
      title: "Minha tarefa",
      description: "Varrer a casa antes da esposa chegar",
    ),
  ];

  void _incrementCounter() {
    setState(
      () {
        _counter++;
        task.add(
          TodoItemEntity(
            title: "Título $_counter",
            description: "Descrição $_counter",
          ),
        );
      },
    );
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAB540),
        title: Text(widget.title),
        titleTextStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _counter,
          itemBuilder: (context, index) {
            return TodoItemWidget(
              title: task[index].title,
              description: task[index].description,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(
              Icons.add,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Visibility(
            visible: _counter > 0,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}

// OutlinedButton(onPressed: _incrementCounter, child: Text('Novo Botão'),
// style: ButtonStyle(
//   backgroundColor: WidgetStateProperty.all(Colors.green),
// ),
// )
