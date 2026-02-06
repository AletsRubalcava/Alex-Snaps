import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class DeleteCommand extends Command {
  @override
  final name = 'delete';

  @override
  final description =
      'Delete photos from the app. Introduce file name to delete a single file, or "." to delete every file on the directory.';

  Database database;

  DeleteCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Value not introduced.');
      printUsage();
      exit(1);
    }

    final fileName = results[0];

    final dir = Directory('${Directory.current.path}/../app/assets/images');
    if (!dir.existsSync()) {
      print('$dir not found!');
      exit(1);
    }

    /*final imageFiles = dir.listSync().whereType<File>();

    for (final file in imageFiles) {
      final name = file.uri.pathSegments.last;
      if (name == fileName) {
        String id = database.lookForPhotoByName(fileName);
        database.removePhoto(id);
      }
    }
    print('File does not exist!');*/

    String id = database.lookForPhotoByName(fileName);

    if (results.length > 1) {
      String id = database.lookForPhotoByName(fileName);

      for (int i = 0; i < results.length; i++) {
        database.removeCategoryToPhoto(id, results[i]);
      }
      return;
    }

    database.removePhoto(id);
  }
}
