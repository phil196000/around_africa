import 'package:around_africa/redux/actions/itemsaction.dart';

import 'appstate.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      items: action is GetItemsActionSuccess ? action.items : state.items);
  // return state;
}
