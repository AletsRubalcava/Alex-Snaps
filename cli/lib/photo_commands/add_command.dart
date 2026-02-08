import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:path/path.dart' as path;

class AddCommand extends Command {
  @override
  final name = 'add';

  @override
  final description =
      'Add photos to the app. '
      'Introduce file name to add a single file, or "." to add every file on the directory.';

  Database database;

  AddCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Value(s) not introduced.');
      printUsage();
      exit(1);
    }

    final fileName = results.first;
    final categories = results.skip(1).toList();

    if(fileName == '.'){
      print('Massive charge');
      return;
    }

    final String? existingId = database.lookForPhotoByName(fileName);

    if (existingId != null) {
      if (categories.isNotEmpty) {
        _addCategories(existingId, categories);
        return;
      }
    }

    final File? photoFile = database.lookForFile(
        fileName, path.join('data', 'import'));

    if (photoFile == null) {
      print('File not found in import directory.');
      return;
    }

    if (database.lookForFile(fileName, path.join('app', 'assets', 'images')) !=
        null) {
      print('File already exist in assets/images');
      return;
    }

    database.addPhoto(photoFile);

    if (categories.isNotEmpty) {
      final newId = database.lookForPhotoByName(fileName)!;
      _addCategories(newId, categories);
    }
  }

  void _addCategories(String id, List<String> categories){
    for(final cat in categories){
      database.addCategoryToPhoto(id, cat);
    }
  }
}