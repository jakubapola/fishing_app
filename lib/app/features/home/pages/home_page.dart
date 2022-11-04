import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishing_app/app/features/add/pages/add_page.dart';
import 'package:fishing_app/app/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Catches'),
      ),
      body: const _HomePageBody(),
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
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..start(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final docs = state.item?.docs;
          if (docs == null) {
            return const SizedBox.shrink();
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            children: [
              for (final doc in docs)
                Dismissible(
                  key: ValueKey(doc.id),
                  background: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32.0),
                        child: Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (direction) {
                    context.read<HomeCubit>().remove(documentID: doc.id);
                  },
                  child: _ListVievItem(document: doc),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ListVievItem extends StatelessWidget {
  const _ListVievItem({
    Key? key,
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> document;

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
              Expanded(
                child: Container(
                  height: 180,
                  width: 170,
                  decoration: const BoxDecoration(color: Colors.yellow),
                ),
              ),
              Container(
                height: 180,
                width: 170,
                decoration: const BoxDecoration(color: Colors.red),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Data:'),
                          const SizedBox(height: 3),
                          Text((document['date'] as Timestamp)
                              .toDate()
                              .toString()),
                          const SizedBox(height: 5),
                          const Text('Gatunek:'),
                          const SizedBox(height: 3),
                          Text(
                            document['name'],
                          ),
                          const SizedBox(height: 5),
                          const Text('Długość:'),
                          const SizedBox(height: 3),
                          Text(document['lenght'].toString()),
                          const SizedBox(height: 5),
                          const Text('Waga kg:'),
                          const SizedBox(height: 3),
                          Text(document['weight'].toString()),
                        ],
                      ),
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
