import 'package:fishing_app/app/features/add/pages/add_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Catches'),
      ),
      body: const ListViveItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ListViveItem extends StatelessWidget {
  const ListViveItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 165,
                width: 165,
                decoration: const BoxDecoration(color: Colors.yellow),
              ),
              Container(
                height: 165,
                width: 165,
                decoration: const BoxDecoration(color: Colors.red),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Data:'),
                        SizedBox(height: 3),
                        Text('12.03.2022'),
                        SizedBox(height: 5),
                        Text('Gatunek:'),
                        SizedBox(height: 3),
                        Text('Pstrąg potokowy'),
                        SizedBox(height: 5),
                        Text('Długość:'),
                        SizedBox(height: 3),
                        Text('62 cm'),
                        SizedBox(height: 5),
                        Text('Waga:'),
                        SizedBox(height: 3),
                        Text('1,2 kg'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
