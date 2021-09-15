import 'package:around_africa/data/item.dart';

class GetItemsAction {
  final bool loading;
  GetItemsAction({this.loading = true});
}

class GetItemsActionSuccess {
  final List<ItemModel> items;

  GetItemsActionSuccess({this.items = const []});
}
