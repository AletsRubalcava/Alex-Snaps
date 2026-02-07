import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:cli/photo_class.dart';

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

    final fileName = results[0];

    database.lookForEssentialDirectories();
    return;
    /*
    //Looks for file
    for(final dir in directories){
      bool found = findFile(results[0],dir);
      if(found){
        print('File already exist in $dir.');
        exit(1);
      }
    }

    Photo photo = Photo.createID(fileName);
    database.addPhoto(photo);

    if (results.length > 1) {
      for(int i = 1; i < results.length; i++){
        database.addCategoryToPhoto(photo.id, results[i]);
      }
    }
  }

  bool findFile(String results, String path) {
    final dir = Directory('${Directory.current.path}/../$path');

    final imageFiles = dir.listSync().whereType<File>();

    for (final file in imageFiles) {
      final name = file.uri.pathSegments.last;
      if (name == results) {
        return true;
      }
    }
    return false;*/
  }
}