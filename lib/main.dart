import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/Pages/main_page.dart';
import 'package:tourism_app/Pages/onboarding_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

bool _isFirebaseInitialized = false;

Future<void> initializeFirebase() async {
  if (!_isFirebaseInitialized) {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _isFirebaseInitialized =
          true; // Set the flag to true after initialization
      print("Firebase initialized successfully.");
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  } else {
    print("Firebase is already initialized.");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  // Check if the user has completed onboarding before
  void _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
    setState(() {
      isFirstTime = !seenOnboarding;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Show OnboardingScreen if it's the first time, otherwise MainPage
      home: isFirstTime ? const OnboardingScreen() : const MainPage(),
    );
  }
}
