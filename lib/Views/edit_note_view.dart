import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/edit_note.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNote());
  }
}
