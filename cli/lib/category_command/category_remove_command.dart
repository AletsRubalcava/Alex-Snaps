import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class CategoryRemoveCommand extends Command {
  @override
  final name = 'remove';

  @override
  final description = 'Removes a category from de database';

  final Database database;

  CategoryRemoveCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Value not introduced.');
      printUsage();
      exit(1);
    }

    if (results.length > 1) {
      print('This command only accepts one parameter.');
      printUsage();
      exit(1);
    }

    bool found = database.lookForCategory(results[0]);

    if (!found) {
      print('This category does not exist.');
      exit(1);
    }
    database.removeCategory(results[0]);
    print('Category ${results[0]} removed!');
  }
}
