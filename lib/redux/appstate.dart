import 'package:around_africa/data/item.dart';
import 'package:around_africa/data/touristspot.dart';

class AppState {
  final List<TouristSpot> spots;
  final String? selected;
  AppState({this.spots = const [], this.selected = "Location"});
}
