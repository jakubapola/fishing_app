import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add'),
        ),
        body: const _AddPageBody());
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Gatunek ryby'),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Waga kg'),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Długość cm'),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Lokacja'),
          ),
        ),
        const SizedBox(height: 20),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Przynęta'),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            );
          },
          child: const Text('Data'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Zapisz'),
        ),
      ],
    );
  }
}
