import 'package:elementary/elementary.dart';
import 'package:time_tracker/data/note_repository.dart';
import 'package:time_tracker/domain/note.dart';
import 'package:time_tracker/ui/screen/note_list_screen/note_list_screen.dart';

/// Model for [NoteListScreen]
class NoteListScreenModel extends ElementaryModel {
  final MockNoteRepository _noteRepository;

  NoteListScreenModel(
    this._noteRepository,
    ErrorHandler errorHandler,
  ) : super(errorHandler: errorHandler);

  /// Return iterable notes.
  Future<Iterable<Note>> loadNotes() async {
    try {
      final res = await _noteRepository.getAllNotes();
      return res;
    } on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}
