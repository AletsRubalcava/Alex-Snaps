import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class CategoryListCommand extends Command {
  @override
  final name = 'list';

  @override
  final description = 'Lists all the available categories.';

  final Database database;

  CategoryListCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if(results.isNotEmpty){
      print('This command does not accepts arguments');
      return;
    }

    List<String> categories = database.getCategories();

    if (categories.isEmpty) {
      print('No active categories.');
      return;
    }

    print('Active categories:');
    for (final category in categories) {
      print(category);
    }
  }
}
