import 'package:intl/intl.dart';

class ItemModel {
  ItemModel({
    required this.weight,
    required this.lenght,
    required this.bait,
    required this.name,
    required this.location,
    required this.releaseDate,
  });
  final double weight;
  final double lenght;
  final String bait;
  final String name;
  final String location;
  final DateTime releaseDate;
}
