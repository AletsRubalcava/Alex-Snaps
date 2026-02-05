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
    List<String> categories = database.getCategories();

    if (categories.isEmpty) {
      print('No active categories.');
      exit(0);
    }

    print('Active categories:');
    for (final category in categories) {
      print(category);
    }
  }
}
