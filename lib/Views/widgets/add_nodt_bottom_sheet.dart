import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widgets/add_note_form.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
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
                customSnakBatr(
                  context,
                  message: S.of(context).addSuccess,
                  isSuccess: true,
                );
                Navigator.of(context).pop();
              } else if (state is AddNoteFailure) {
                customSnakBatr(
                  context,
                  message: state.errorMessage,
                  isSuccess: false,
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
