import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class CategoryCreateCommand extends Command {
  @override
  final name = 'create';

  @override
  final description = 'Creates a new category. Accepts one or more inputs.';

  final Database database;

  CategoryCreateCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Value(s) not introduced.');
      printUsage();
      exit(1);
    }

    for(String cat in results){
      bool found = database.lookForCategory(cat);
      if (found) {
        print('Category: "$cat" already exist.');
        continue;
      }
      database.addCategory(cat);
      print('Category $cat added!');
    }
  }
}
