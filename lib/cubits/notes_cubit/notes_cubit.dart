import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];

  feachAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  searchedNotes(String query) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes =
        notesBox.values
            .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    emit(NotesSuccess());
  }
}
