import 'package:around_africa/redux/actions/itemsaction.dart';
import 'package:redux/redux.dart';

import '../appstate.dart';

void fetchItems(Store<AppState> store, action, NextDispatcher next) {
  if (action is GetItemsAction) {}

  // Make sure our actions continue on to the reducer.
  next(action);
}
