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

    /*if (fileName == '.') {
      _fullImport(newCategories);
      return;
    }
    _singleImport(fileName, newCategories);*/

    toWebp();

    database.save();
  }

  void _fullImport(List<String> categories){
    final thumb = argResults!['thumb'] as bool;

    final import = Directory(
      path.join(database.projectRoot, 'cli', 'data', 'import'),
    );
    final imageFiles = import.listSync().whereType<File>();

    for (final file in imageFiles) {
      final fileName = file.uri.pathSegments.last;
      final String? id;
      if(thumb){
        id = database.thumbFileNameMap[fileName];
      }else{
        id = database.photoFileNameMap[fileName];
      }
      if (id == null) {
        final photoId = database.addPhoto(file,thumb);
        if(categories.isNotEmpty) _addCategories(photoId, categories, thumb);
        continue;
      }
      if(categories.isNotEmpty) _addCategories(id, categories, thumb);
    }
    print('Photos added successfully!');
    return;
  }

  void _singleImport(String fileName, List<String> categories){
    final thumb = argResults!['thumb'] as bool;
    final String? existingId;

    if(thumb){
      existingId = database.thumbFileNameMap[fileName];
    }else{
      existingId = database.photoFileNameMap[fileName];
    }

    if (existingId != null) {
      if (categories.isNotEmpty) {
        _addCategories(existingId, categories, thumb);
        return;
      }
    }

    final File? photoFile = database.lookForFile(
      fileName,
      path.join('cli', 'data', 'import'),
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
      _addCategories(newId, categories, thumb);
    }
  }

  void _addCategories(String id, List<String> categories, bool thumb) {
    for (final cat in categories) {
      database.addCategoryToPhoto(id, cat, thumb);
    }
  }
}

Future<void> toWebp() async{
  final result = await Process.run('node', ['lib/photo_commands/webp_converter.js'],
  workingDirectory: Directory.current.path
  );

  if(result.stdout.isNotEmpty) print(result.stdout);

  if (result.exitCode != 0) {
    print('Error: ${result.stderr}');
    return;
  }
}