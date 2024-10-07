import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/Pages/main_page.dart';
import 'package:tourism_app/Pages/onboarding_screen.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Correct Firebase initialization for web
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBnEHIFmMFY4H44jjlUm-si_mcAoFQ38Uc",
        authDomain: "tourismapp-e188e.firebaseapp.com",
        databaseURL: "https://tourismapp-e188e-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "tourismapp-e188e",
        storageBucket: "tourismapp-e188e.appspot.com",
        messagingSenderId: "21712256481",
        appId: "1:21712256481:web:41c1d4b600fe3e637326a0",
        measurementId: "G-P3T35NMVEF",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime(); // Call the async function without awaiting
  }

  // Check if the user has completed onboarding before
  Future<void> _checkIfFirstTime() async {
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
