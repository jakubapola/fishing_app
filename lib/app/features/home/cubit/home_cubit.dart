import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('item')
        .orderBy('date')
        .snapshots()
        .listen(
      (item) {
        emit(HomeState(item: item));
      },
    )..onError(
        (error) {
          emit(const HomeState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('item')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const HomeState(removingErrorOccured: true),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
