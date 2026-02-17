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
    final categories = argResults!.rest;

    if (categories.isEmpty) {
      print('Value(s) not introduced.');
      printUsage();
      return;
    }

    for(String cat in categories){
      if (database.categories.contains(cat)) {
        print('Category: "$cat" already exist.');
        continue;
      }
      database.addCategory(cat);
      print('Category $cat added!');
    }
    database.save();
  }
}
