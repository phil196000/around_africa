import 'dart:convert';
import 'dart:developer';

import 'package:around_africa/data/item.dart';
import 'package:around_africa/redux/actions/itemsaction.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

import '../appstate.dart';

void fetchItems(Store<AppState> store, action, NextDispatcher next) async {
  if (action is GetItemsAction) {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);

      List<ItemModel> items = [];
      responseBody.forEach((element) {
        ItemModel item = ItemModel.fromJson(element);
        items.add(item);
      });
      store.dispatch(GetItemsActionSuccess(items: items));
      store.dispatch(GetItemsAction(loading: false));
    } else {
      store.dispatch(GetItemsActionSuccess(items: []));
      store.dispatch(GetItemsAction(loading: false));
    }
  }

  // Make sure our actions continue on to the reducer.
  next(action);
}
