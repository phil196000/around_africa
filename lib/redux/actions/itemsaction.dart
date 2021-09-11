import 'package:around_africa/data/item.dart';

class GetItemsAction {}

class GetItemsActionSuccess {
  final List<ItemModel> items;

  GetItemsActionSuccess({this.items = const []});
}
