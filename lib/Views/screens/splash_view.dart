import 'package:flutter/material.dart';
import 'package:notes_app/Views/screens/notes_view.dart';
import 'package:notes_app/constants/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotesView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/images/notes_logo.png', width: 250),
            ),
          ),
        ],
      ),
    );
  }
}
