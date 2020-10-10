import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/ui/girl/girl_bloc.dart';
import 'package:bloc_architecture/ui/girl/girl_page.dart';
import 'package:bloc_architecture/ui/tab_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'ui/home/home_page_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp(Environment.dev);
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<GirlBloc>()),
          BlocProvider(create: (context) => getIt<HomePageBloc>()),
        ],
        child: TabBarPage(),
      ),
    );
  }
}
