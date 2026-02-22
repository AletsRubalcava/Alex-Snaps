import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:shared/category_class.dart';

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

    Map<String, Category> categories = database.getCategories();

    if (categories.isEmpty) {
      print('No active categories.');
      return;
    }

    print('Active categories:');
    categories.forEach((id, category) {
      print(category.name);
    });
    database.save();
  }
}
