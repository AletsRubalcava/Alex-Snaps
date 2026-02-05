import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class CategoryCreateCommand extends Command {
  @override
  final name = 'create';

  @override
  final description = 'Creates a new category';

  final Database database;

  CategoryCreateCommand(this.database);

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

    if (found) {
      print('This category already exist.');
      exit(1);
    }
    database.addCategory(results[0]);
    print('Category ${results[0]} added!');
  }
}
