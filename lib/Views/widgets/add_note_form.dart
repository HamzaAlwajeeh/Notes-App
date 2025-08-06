import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Views/widgets/custom_button.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomTextField(
            hint: S.of(context).title_hint,
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            maxLines: 5,
            hint: S.of(context).content_hint,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          SizedBox(height: 50),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder:
                (context, state) => CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    var currentDate = DateTime.now();
                    var formattedDate = DateFormat(
                      'yyyy-MM-dd',
                    ).format(currentDate);
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var note = NoteModel(
                        title: title!,
                        subTitle: subtitle!,
                        date: formattedDate,
                        color: Colors.amber.toARGB32(),
                      );
                      BlocProvider.of<AddNoteCubit>(
                        context,
                      ).addNote(note: note);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
