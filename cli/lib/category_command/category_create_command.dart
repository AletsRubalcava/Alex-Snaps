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

    if (results.length != 2) {
      print('This command only accepts two arguments');
      printUsage();
      return;
    }

    final category = results.first;
    final thumbName = results.last;

    final id = database.addCategory(category, thumbName);

    if(id == null){
      return;
    }
    print('Category $category added!');
    database.save();
  }
}
