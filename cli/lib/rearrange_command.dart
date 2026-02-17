import 'package:args/command_runner.dart';
import 'package:cli/database.dart';

class RearrangeCommand extends Command {
  @override
  final name = 'rearrange';

  @override
  final description = 'Rearranges the photos order to fill the gaps';

  Database database;

  RearrangeCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not accepts arguments.');
      return;
    }

    final sortedPhotos = database.photos.values.toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    for(int i = 0; i < sortedPhotos.length; i++){
      sortedPhotos[i].order = i + 1;
    }
    database.save();

    print('Photos have been rearranged successfully!');
  }
}
