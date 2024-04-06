import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/login_page/login_page.dart';
import 'package:nymblelabs_music/data/login_repository.dart';
import 'app/login_page/bloc/login_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData(useMaterial3: false, primaryColor: Colors.white),
        theme: ThemeData(
            useMaterial3: false,
            primaryColor: Colors.black,
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),bodyLarge: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.black
                        .withOpacity(0.5);
                  } else {
                    return Colors.black;
                  }
                },
              ),
            )),
          iconTheme: const IconThemeData(
            color: Colors.black,
          )
        ),
        home: LoginPage());
  }
}

class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
