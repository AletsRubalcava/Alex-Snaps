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
      return;
    }

    final fileName = results[0];

    String? id = database.fileNameMap[fileName];

    if(id == null){
      print("File not found.");
      return;
    }

    if (results.length > 1) {
      for (int i = 1; i < results.length; i++) {
        database.removeCategoryToPhoto(id, results[i]);
      }
      return;
    }
    database.removePhoto(id);
  }
}
