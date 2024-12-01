import 'package:cred/core/config/theme/app_theme.dart';
import 'package:cred/presentation/home/cubit/home_cubit.dart';
import 'package:cred/presentation/home/cubit/view_cubit.dart';
import 'package:cred/presentation/home/pages/home_page.dart';
import 'package:cred/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ViewCubit()..showFirstView(),
          ),
          BlocProvider(
            create: (context) => HomeCubit()..getData(),
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
