part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.item,
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final  QuerySnapshot<Map<String, dynamic>>? item;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
