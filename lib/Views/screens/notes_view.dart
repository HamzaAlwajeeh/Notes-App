import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widgets/add_nodt_bottom_sheet.dart';
import 'package:notes_app/Views/widgets/notes_view_body.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).feachAllNotes();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
