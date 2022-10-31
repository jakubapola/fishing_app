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
    return const Scaffold();
  }
}
