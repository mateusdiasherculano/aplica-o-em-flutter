import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactionform extends StatefulWidget {
  final void Function(String, DateTime) onSubmit;

  Transactionform(this.onSubmit);

  @override
  State<Transactionform> createState() => _TransactionformState();
}

class _TransactionformState extends State<Transactionform> {
  final _nameController = TextEditingController();
  DateTime? _selecteDate;

  _submitForm() {
    final name = _nameController.text;

    if (name.isEmpty || _selecteDate == null) {
      return;
    }

    widget.onSubmit(name, _selecteDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selecteDate = pickedDate;
      });
    });
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
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nome completo:',
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _selecteDate == null
                        ? 'informe a data do seu nascimento:'
                        : DateFormat('d/MMM/y').format(_selecteDate!),
                  ),
                  FloatingActionButton(
                    onPressed: _showDatePicker,
                    child: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => _submitForm(),
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
