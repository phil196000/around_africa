import 'package:around_africa/redux/actions/itemsaction.dart';
import 'package:around_africa/redux/actions/selectedtab.dart';

import 'appstate.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      spots: state.spots,
      selected: action is SetSelectedDrawer ? action.selected : state.selected);
  // return state;
}
