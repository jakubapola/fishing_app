import 'package:fishing_app/app/features/add/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

String? _name;
String? _bait;
String? _location;
String? _weight;
String? _lenght;
DateTime? _date;

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocBuilder<AddCubit, AddState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add'),
              actions: [
                IconButton(
                  onPressed: _name == null ||
                          _bait == null ||
                          _location == null ||
                          _weight == null ||
                          _date == null
                      ? null
                      : () {
                          context.read<AddCubit>().add(
                                _name!,
                                _bait!,
                                _location!,
                                _weight!.toString(),
                                _lenght!.toString(),
                                _date!,
                              );
                        },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: _AddPageBody(
              onNameChanged: (newValue) {
                setState(() {
                  _name = newValue;
                });
              },
              onBaitChanged: (newValue) {
                setState(() {
                  _bait = newValue;
                });
              },
              onLocationChanged: (newValue) {
                setState(() {
                  _location = newValue;
                });
              },
              onWeightChanged: (newValue) {
                setState(() {
                  _weight = newValue;
                });
              },
              onLenghtChanged: (newValue) {
                setState(() {
                  _lenght = newValue;
                });
              },
              onDateChanged: (newValue) {
                setState(() {
                  _date = newValue;
                });
              },
              selectedDateFormatted: _date?.toIso8601String(),
            ),
          );
        },
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    Key? key,
    required this.onNameChanged,
    required this.onBaitChanged,
    required this.onDateChanged,
    required this.onWeightChanged,
    required this.onLenghtChanged,
    required this.onLocationChanged,
    this.selectedDateFormatted,
  }) : super(key: key);

  final Function(String) onNameChanged;
  final Function(String) onBaitChanged;
  final Function(String) onLocationChanged;
  final Function(String) onWeightChanged;
  final Function(String) onLenghtChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onNameChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Gatunek ryby'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onWeightChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Waga kg'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onLenghtChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Długość cm'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onLocationChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '',
            label: Text('Lokacja'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onBaitChanged,
          decoration: const InputDecoration(
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
            onDateChanged(selectedDate);
          },
          child: Text(selectedDateFormatted ?? 'Data'),
        ),
        // ElevatedButton(
        // onPressed: _name == null ||
        //         _bait == null ||
        //         _location == null ||
        //         _weight == null ||
        //         _lenght == null ||
        //         _date == null
        //     ? null
        //       : () {
        //           context.read<AddCubit>().add(
        //                 _name!,
        //                 _bait!,
        //                 _location!,
        //                 _weight!.toString(),
        //                 _lenght!.toString(),
        //                 _date!,
        //               );
        //         },
        //   child: const Text('Zapisz'),
        // ),
      ],
    );
  }
}
