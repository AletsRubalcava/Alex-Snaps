import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class TruncateCategoriesCommand extends Command {
  @override
  final name = 'categories';

  @override
  final description =
      'Truncates the categories from de database.';

  final Database database;

  TruncateCategoriesCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not receives arguments');
      return;
    }

    print('This will delete all categories, are you sure you want to continue?');
    print('Type "YES" to continue, anything else to abort.');

    String? input = stdin.readLineSync();

    if(input == "YES"){
      database.categories.clear();

      for(final photo in database.photos.values){
        photo.categories.clear();
      }

      print('Categories cleared!');
      return;
    }
    print('Aborting.');
  }
}