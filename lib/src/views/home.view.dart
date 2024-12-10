import 'package:flutter/material.dart';
import 'package:curso/src/widgets/widgets.dart';
import 'package:curso/src/entities/todo_item.entity.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  List<TodoItemEntity> task = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _incrementCounter() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.all(16),
          child: Form(
            key: GlobalKey<FormState>(),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DialogTitleWidget(
                    title: "Inserir Tarefa",
                  ),
                  TextInputWidget(
                    label: "Título",
                    controller: titleController,
                  ),
                  TextInputWidget(
                    label: "Descrição",
                    maxLines: 10,
                    controller: descriptionController,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(
                            () => task.add(
                              TodoItemEntity(
                                title: titleController.text,
                                description: descriptionController.text,
                              ),
                            ),
                          );
                          titleController.clear();
                          descriptionController.clear();
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          side: const WidgetStatePropertyAll(BorderSide.none),
                        ),
                        child: const Text(
                          'Criar tarefa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _decrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: task.length,
          itemBuilder: (context, index) {
            return task.isNotEmpty
                ? TodoItemWidget(
                    title: task[index].title,
                    description: task[index].description,
                  )
                : Container();
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent.shade200,
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          Visibility(
            visible: task.isNotEmpty,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: FloatingActionButton(
                backgroundColor: Colors.blueAccent.shade200,
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
