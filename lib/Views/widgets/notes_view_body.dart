import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Views/widgets/custom_app_bar.dart';
import 'package:notes_app/Views/widgets/custom_text_field.dart';
import 'package:notes_app/Views/widgets/notes_list_view.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/generated/l10n.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 50),
          isSearch
              ? CustomTextField(
                hint: S.of(context).searchNote,
                suffixIcon: Icons.close,
                onSuffixIconPressed: () {
                  setState(() {
                    isSearch = false;
                  });
                  BlocProvider.of<NotesCubit>(context).feachAllNotes();
                },
                onChanged: (value) {
                  BlocProvider.of<NotesCubit>(context).searchedNotes(value!);
                },
              )
              : CustomAppBar(
                title: S.of(context).home_title,
                icon: Icons.search,
                onTap: () {
                  setState(() {
                    isSearch = true;
                  });
                },
              ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
