import 'package:args/command_runner.dart';
import 'package:cli/add_command.dart';

void main(List<String> arguments) {
  final runner = CommandRunner(
    'alexsnaps',
    'Command runner for Alex Snaps app',
  );

  runner.addCommand(AddCommand());
  runner.run(arguments);
}