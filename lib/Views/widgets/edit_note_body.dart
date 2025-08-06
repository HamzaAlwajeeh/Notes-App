import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widgets/custom_app_bar.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/models/note_model.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: EditNoteField(),
    );
  }
}

class EditNoteField extends StatefulWidget {
  const EditNoteField({super.key});

  @override
  State<EditNoteField> createState() => _EditNoteFieldState();
}

class _EditNoteFieldState extends State<EditNoteField> {
  String? title, subTitle;

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    NoteModel? editingNote = BlocProvider.of<EditNoteCubit>(context).note;
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 40),
          CustomAppBar(
            title: S.of(context).edit_title,
            icon: Icons.check,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteEditing = NoteModel(
                  title: title ?? editingNote!.title,
                  subTitle: subTitle ?? editingNote!.subTitle,
                  date: DateTime.now().toString(),
                  color: editingNote!.color,
                );
                BlocProvider.of<EditNoteCubit>(
                  context,
                ).editNote(note: noteEditing);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(height: 40),
          CustomTextField(
            initialValue: editingNote?.title,
            hint: S.of(context).title_hint,
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            initialValue: editingNote?.subTitle,
            maxLines: 5,
            hint: S.of(context).content_hint,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
