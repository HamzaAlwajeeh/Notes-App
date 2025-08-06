import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widgets/custom_app_bar.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/helper/custom_snak_bar.dart';
import 'package:notes_app/models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.editingNote});

  final NoteModel editingNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: EditNoteField(editingNote: editingNote),
      ),
    );
  }
}

class EditNoteField extends StatefulWidget {
  const EditNoteField({super.key, required this.editingNote});
  final NoteModel editingNote;
  @override
  State<EditNoteField> createState() => _EditNoteFieldState();
}

class _EditNoteFieldState extends State<EditNoteField> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        CustomAppBar(
          title: S.of(context).edit_title,
          icon: Icons.check,
          onTap: () {
            editNodeMethod(context);
          },
        ),
        SizedBox(height: 40),
        CustomTextField(
          initialValue: widget.editingNote.title,
          hint: S.of(context).title_hint,
          onChanged: (value) {
            title = value;
          },
        ),
        SizedBox(height: 16),
        CustomTextField(
          initialValue: widget.editingNote.subTitle,
          maxLines: 5,
          hint: S.of(context).content_hint,
          onChanged: (value) {
            subTitle = value;
          },
        ),
        SizedBox(height: 50),
      ],
    );
  }

  void editNodeMethod(BuildContext context) {
    widget.editingNote.title = title ?? widget.editingNote.title;
    widget.editingNote.subTitle = subTitle ?? widget.editingNote.subTitle;
    widget.editingNote.save();
    BlocProvider.of<NotesCubit>(context).feachAllNotes();
    customSnakBatr(context, message: S.of(context).editSuccess);
    Navigator.pop(context);
  }
}
