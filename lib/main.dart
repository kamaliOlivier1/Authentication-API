import 'package:assignment_2/calculator.dart';
import 'package:assignment_2/theme/theme.dart';
import 'package:assignment_2/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'home_page.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(), child: myApp()),
  );
}

class myApp extends StatelessWidget {
  get darkMode => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,

      routes: {'/calculator': (context) => Calculator()},
    );
  }
}
