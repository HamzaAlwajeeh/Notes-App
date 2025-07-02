import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [SizedBox(height: 40), CustomAppBar()]),
    );
  }
}
