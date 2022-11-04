
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState());

  Future<void> add(
    String name,
    String bait,
    String location,
    String weight,
    String lenght,
    DateTime date,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('item').add(
        {
          'name': name,
          'bait': bait,
          'location': location,
          'weight': weight,
          'lenght': lenght,
          'date': date,
        },
      );
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
