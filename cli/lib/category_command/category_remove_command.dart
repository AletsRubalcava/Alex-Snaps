import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class CategoryRemoveCommand extends Command {
  @override
  final name = 'remove';

  @override
  final description =
      'Removes a category from de database. Accepts one or more inputs';

  final Database database;

  CategoryRemoveCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Value(s) not introduced.');
      printUsage();
      return;
    }

    for(String cat in results) {
      bool found = database.lookForCategory(cat);
      if (!found) {
        print('Category: "$cat" does not exist.');
        continue;
      }
      database.removeCategory(cat);
      print('Category $cat removed!');
    }
  }
}
