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
    final categories = argResults!.rest;

    if (categories.isEmpty) {
      print('Value(s) not introduced.');
      printUsage();
      return;
    }

    final List<String> newCategories = database.validateCategories(categories);

    if(newCategories.isNotEmpty) {
      for (String cat in newCategories) {
        database.removeCategory(cat);
        print('Category $cat removed!');
      }
    }
  }
}
