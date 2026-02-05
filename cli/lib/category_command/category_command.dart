import 'package:args/command_runner.dart';
import 'package:cli/category_command/category_create_command.dart';
import 'package:cli/category_command/category_remove_command.dart';
import 'package:cli/database.dart';
import 'category_list_command.dart';

class CategoryCommand extends Command {
  @override
  final name = 'category';

  @override
  final description =
      'Parent command for managing categories. Requires a subcommand';

  final Database database;

  CategoryCommand(this.database) {
    addSubcommand(CategoryListCommand(database));
    addSubcommand(CategoryCreateCommand(database));
    addSubcommand(CategoryRemoveCommand(database));
  }
}
