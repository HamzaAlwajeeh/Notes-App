import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/custom_button.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 30),
            CustomTextField(hint: "Title"),
            SizedBox(height: 16),
            CustomTextField(maxLines: 5, hint: "Content"),
            SizedBox(height: 50),
            CustomButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
