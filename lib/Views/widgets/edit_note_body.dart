import 'package:flutter/material.dart';
import 'package:notes_app/Views/widgets/custom_app_bar.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';
import 'package:notes_app/generated/l10n.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 40),
          CustomAppBar(title: S.of(context).edit_title, icon: Icons.check),
          SizedBox(height: 40),
          CustomTextField(hint: S.of(context).title_hint),
          SizedBox(height: 16),
          CustomTextField(maxLines: 5, hint: S.of(context).content_hint),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
