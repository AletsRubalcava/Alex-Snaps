import 'package:args/command_runner.dart';
import 'package:cli/add_command.dart';
import 'package:cli/category_command/category_command.dart';
import 'package:cli/database.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'alexsnaps',
    'Command runner for Alex Snaps app',
  );

  Database database = Database();
  database.fillCategories();

  runner.addCommand(AddCommand());
  runner.addCommand(CategoryCommand(database));
  runner.run(arguments);
  database.writeDatabaseFile();
}