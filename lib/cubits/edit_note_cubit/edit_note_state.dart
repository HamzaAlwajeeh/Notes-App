part of 'edit_note_cubit.dart';

abstract class EditNoteState {}

final class EditNoteInitial extends EditNoteState {}

class EditNoteLoadingState extends EditNoteState {}

class EditNoteSuccessState extends EditNoteState {}

class EditNoteFailureState extends EditNoteState {
  final String errorMessage;

  EditNoteFailureState({required this.errorMessage});
}
