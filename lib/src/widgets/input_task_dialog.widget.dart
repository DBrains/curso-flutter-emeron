import 'package:flutter/material.dart';
import 'package:curso/src/widgets/text_input.widget.dart';
import 'package:curso/src/widgets/dialog_title.widget.dart';

class InputTaskDialogWidget extends StatelessWidget {
  const InputTaskDialogWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.function,
  });

  final VoidCallback function;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
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
                    onPressed: function,
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
  }
}
