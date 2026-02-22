import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class DeleteCommand extends Command {
  @override
  final name = 'delete';

  @override
  final description =
      'Delete photos from the app. Introduce file name to delete a single file.';

  Database database;

  DeleteCommand(this.database){
    argParser.addFlag(
        'thumb',
        abbr: 't',
        help: 'Marks the photo as a thumbnail.'
    );
  }

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Value not introduced.');
      printUsage();
      return;
    }

    final fileName = results.first;
    final thumb = argResults!['thumb'] as bool;

    String? id = database.fileNameMap[fileName];

    if (id == null) {
      print("File not found.");
      return;
    }

    if (results.length > 1) {
      final categories = results.skip(1).toList();
      final newCategories = database.validateCategories(categories);

      for (final cat in newCategories) {
        database.removeCategoryToPhoto(id, cat);
      }
      return;
    }
    database.removePhoto(id, thumb);
    database.save();
  }
}
