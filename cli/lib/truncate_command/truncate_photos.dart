import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class TruncatePhotosCommand extends Command {
  @override
  final name = 'photos';

  @override
  final description =
      'Truncates the photos from de database.';

  final Database database;

  TruncatePhotosCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not receives arguments');
      return;
    }

    print('This will delete all the photos, are you sure you want to continue?');
    print('Type "YES" to continue, anything else to abort.');

    String? input = stdin.readLineSync();

    if(input == "YES"){
      database.photos.clear();
      print('Photos cleared!');
      return;
    }
    print('Aborting.');
  }
}