import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/Views/widgets/edit_note_body.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/helper/custom_snak_bar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: BlocConsumer<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          if (state is EditNoteLoadingState) {
          } else if (state is EditNoteSuccessState) {
            customSnakBatr(context, message: S.of(context).editSuccess);
            Navigator.of(context).pop();
          } else if (state is EditNoteFailureState) {
            customSnakBatr(context, message: state.errorMessage);
          }
        },
        builder:
            (context, state) => ModalProgressHUD(
              inAsyncCall: state is EditNoteLoadingState ? true : false,
              child: Scaffold(body: EditNoteBody()),
            ),
      ),
    );
  }
}
