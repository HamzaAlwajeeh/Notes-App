import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/custom_button.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';
import 'package:notes_app/generated/l10n.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CustomTextField(hint: S.of(context).title_hint),
            SizedBox(height: 16),
            CustomTextField(maxLines: 5, hint: S.of(context).content_hint),
            SizedBox(height: 50),
            CustomButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
