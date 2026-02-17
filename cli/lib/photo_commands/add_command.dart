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

  AddCommand(this.database){
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
      print('Value(s) not introduced.');
      printUsage();
      return;
    }

    final fileName = results.first;
    final categories = results.skip(1).toList();
    final newCategories = database.validateCategories(categories);

    if (fileName == '.') {
      _fullImport(newCategories);
      return;
    }
    _singleImport(fileName, newCategories);

    database.save();
  }

  void _fullImport(List<String> categories){
    final thumb = argResults!['thumb'] as bool;

    final import = Directory(
      path.join(database.projectRoot, 'data', 'import'),
    );
    final imageFiles = import.listSync().whereType<File>();

    for (final file in imageFiles) {
      final fileName = file.uri.pathSegments.last;
      final id = database.fileNameMap[fileName];
      if (id == null) {
        final photoId = database.addPhoto(file,thumb);
        if(categories.isNotEmpty) _addCategories(photoId, categories);
        continue;
      }
      if(categories.isNotEmpty) _addCategories(id, categories);
    }
    print('Photos added successfully!');
    return;
  }

  void _singleImport(String fileName, List<String> categories){
    final thumb = argResults!['thumb'] as bool;
    final String? existingId = database.fileNameMap[fileName];

    if (existingId != null) {
      if (categories.isNotEmpty) {
        _addCategories(existingId, categories);
        return;
      }
    }

    final File? photoFile = database.lookForFile(
      fileName,
      path.join('data', 'import'),
    );

    if (photoFile == null) {
      print('File not found in import directory.');
      return;
    }

    if (database.lookForFile(fileName, path.join('app', 'assets', 'images')) !=
        null) {
      print('File already exist in assets/images');
      return;
    }

    final newId = database.addPhoto(photoFile,thumb);
    print('Photo added successfully!');

    if (categories.isNotEmpty) {
      _addCategories(newId, categories);
    }
  }

  void _addCategories(String id, List<String> categories) {
    for (final cat in categories) {
      database.addCategoryToPhoto(id, cat);
    }
  }
}