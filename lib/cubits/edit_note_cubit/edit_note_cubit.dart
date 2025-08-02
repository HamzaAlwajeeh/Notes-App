import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  editNote({required NoteModel note}) async {
    emit(EditNoteLoadingState());
    try {
      // var noteBox = Hive.box<NoteModel>(kNotesBox);

      emit(EditNoteSuccessState());
    } catch (e) {
      emit(EditNoteFailureState(errorMessage: e.toString()));
    }
  }
}
