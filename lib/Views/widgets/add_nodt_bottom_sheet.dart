import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widgets/add_note_form.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/helper/custom_snak_bar.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                customToastBar(
                  context: context,
                  message: S.of(context).addSuccess,
                  icon: Icons.check,
                  backgroundColor: kPrimaryDarkColor,
                  textColor: kPrimaryColor,
                  postion: DelightSnackbarPosition.top,
                );
                BlocProvider.of<NotesCubit>(context).feachAllNotes();
                Navigator.of(context).pop();
              } else if (state is AddNoteFailure) {
                customToastBar(
                  context: context,
                  message: state.errorMessage,
                  icon: Icons.error,
                  backgroundColor: kPrimaryDarkColor,
                  textColor: kPrimaryColor,
                  postion: DelightSnackbarPosition.top,
                );
              }
            },
            builder:
                (context, state) => AbsorbPointer(
                  absorbing: state is AddNoteLoading ? true : false,
                  child: AddNoteForm(),
                ),
          ),
        ),
      ),
    );
  }
}
