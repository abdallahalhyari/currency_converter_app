import 'package:currency_converter_app/injection_container.dart';
import 'package:currency_converter_app/modules/conversion/bloc/conversion_bloc.dart';
import 'package:currency_converter_app/modules/conversion/view/conversion_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey();
late SharedPreferences sharedPreferences;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  sharedPreferences =await SharedPreferences.getInstance();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      navigatorKey: globalKey,
      home: BlocProvider(
        create: (context) => getIt.get<ConversionBloc>()..add(GetCountriesEvent()),
        child: const ConversionView(),
      ),
    );
  }
}
