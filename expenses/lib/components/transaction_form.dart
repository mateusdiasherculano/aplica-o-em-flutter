import 'package:flutter/material.dart';

class Transactionform extends StatefulWidget {
  final void Function(String, String) onSubmit;

  Transactionform(this.onSubmit);

  @override
  State<Transactionform> createState() => _TransactionformState();
}

class _TransactionformState extends State<Transactionform> {
  final nameController = TextEditingController();
  final birthDateController = TextEditingController();

  _submitForm() {
    final name = nameController.text;
    final birthDate = birthDateController.text;

    if (name.isEmpty || birthDate.isEmpty) {
      return;
    }

    widget.onSubmit(name, birthDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Nome:',
              ),
            ),
            TextField(
              controller: birthDateController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'data de nascimento:',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Novo cadastro'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
