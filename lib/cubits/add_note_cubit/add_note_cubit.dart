import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  bool isLoading = false;
  Color selectedColor = Color(0xff0E1F2F);
  addNote({required NoteModel note}) async {
    isLoading = true;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      // await Future.delayed(Duration(seconds: 1));
      isLoading = false;
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
      isLoading = false;
    }
  }
}
