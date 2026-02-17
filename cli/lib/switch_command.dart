import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:cli/photo_class.dart';

class SwitchCommand extends Command {
  @override
  final name = 'switch';

  @override
  final description = 'Switches orders between photos';

  Database database;
  SwitchCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isEmpty) {
      print('Values not introduced');
      printUsage();
      return;
    }

    if (results.length != 2) {
      print('This command requires two arguments');
      printUsage();
      return;
    }

    final originalOrder = results.first;
    final targetOrder = results.last;

    final photo1 = _findPhoto(originalOrder);

    if (photo1 == null) {
      print('Photo $originalOrder was not found.');
      return;
    }

    final photo2 = _findPhoto(targetOrder);
    if (photo2 == null) {
      print('Photo $targetOrder was not found.');
      return;
    }

    //Swaps the orders
    final temp = photo1.order;
    photo1.order = photo2.order;
    photo2.order = temp;
    print(
      'Successfully switched order between "${photo1.name}" and "${photo2.name}".',
    );

    database.save();
  }

  Photo? _findPhoto(String value) {
    final order = int.tryParse(value);
    String? photoId;
    if (order != null) {
      photoId = database.orderMap[order];
    } else {
      photoId = database.fileNameMap[value];
    }
    if (photoId == null) return null;
    return database.photos[photoId];
  }
}