import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/Pages/signup_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFF4B6A67), // Similar green color background
        child: Center(
          // Wrap Column with Center
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrink column to fit content
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo at the top
              Image.asset(
                'assets/images/logo_onboarding.png', // Add your image asset
                height: 120, // Adjust height as needed
              ),
              const SizedBox(height: 40),
              // Title
              const Text(
                "Start Your\nEco-Friendly Journey!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              // "Get Start" Button
              ElevatedButton(
                onPressed: () async {
                  // Save onboarding completion status
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('seenOnboarding', true);

                  // Navigate to MainPage
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background
                  foregroundColor: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  "Get Start",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: OnboardingScreen(),
  ));
}
