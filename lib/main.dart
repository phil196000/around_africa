import 'package:around_africa/data/touristspotList.dart';
import 'package:around_africa/redux/appstate.dart';
import 'package:around_africa/redux/middlewares/fetchitems.dart';
import 'package:around_africa/redux/reducer.dart';
import 'package:around_africa/screens/splash/splash.dart';
import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';

GetIt getIt = GetIt.instance;
void main() {
  final Store<AppState> store = new Store(
    appStateReducer,
    middleware: [],
    initialState: new AppState(spots: touristspots, selected: 'Location'),
  );
  getIt.registerSingleton<Store<AppState>>(store, signalsReady: true);
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store;

  MyApp({required this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Around Africa',
          theme: ThemeData(
              iconTheme: IconThemeData(color: CustomColors.white),
              appBarTheme: AppBarTheme(
                  backgroundColor: CustomColors.primary,
                  iconTheme: IconThemeData(color: CustomColors.white)),
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primaryColor: CustomColors.primary),
          home: Splash(),
        ));
  }
}
