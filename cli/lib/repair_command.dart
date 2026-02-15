import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:cli/database.dart';
import 'package:cli/photo_class.dart';

class RepairCommand extends Command {
  @override
  final name = 'repair';

  @override
  final description =
      'Repairs the database in case a file does not have a photo object or vice versa';

  final Database database;

  RepairCommand(this.database);

  @override
  void run() {
    final results = argResults!.rest;

    if (results.isNotEmpty) {
      print('This command does not accept arguments');
      return;
    }

    //Looks for file images that exist but is not in the database
    _addMissingDatabaseEntries();
    //Removes the orphaned entries from the database
    _removeOrphanDatabaseEntries();
  }

  void _addMissingDatabaseEntries() {
    final photoDir = database.imageDir;
    final thumbDir = database.thumbDir;
    final photoFiles = photoDir.listSync().whereType<File>();
    final thumbFiles = thumbDir.listSync().whereType<File>();
    var photoCount = 0;
    var thumbCount = 0;

    for (final img in photoFiles) {
      final fileName = img.uri.pathSegments.last;
      //If the file does not exist in the database
      if (database.fileNameMap[fileName] == null) {
        database.addPhoto(img, false);
        photoCount++;
      }
    }

    for (final img in thumbFiles) {
      final fileName = img.uri.pathSegments.last;
      //If the file does not exist in the database
      if (database.fileNameMap[fileName] == null) {
        database.addPhoto(img, true);
        thumbCount++;
      }
    }
    print('Added $photoCount photos and $thumbCount thumbs.');
  }

  void _removeOrphanDatabaseEntries() {
    //Copies the map to avoid modifying the original
    final orphanedPhotos = _findOrphans(database.photos, database.imageDir);
    //Removes the orphaned photos from the database
    database.photos.removeWhere((id, photo) => orphanedPhotos.containsKey(id));

    final orphanedThumbs = _findOrphans(database.thumbs, database.thumbDir);
    database.thumbs.removeWhere((id, photo) => orphanedThumbs.containsKey(id));
    print(
      'Removed ${orphanedPhotos.length} photos and ${orphanedThumbs.length} thumbs.',
    );
  }

  Map<String, Picture> _findOrphans(
    Map<String, Picture> originalMap,
    Directory directory,
  ) {
    //Copies the map to avoid modifying the original
    final potentialOrphans = Map<String, Picture>.from(originalMap);
    final imageFiles = directory.listSync().whereType<File>();

    for (final img in imageFiles) {
      final fileName = img.uri.pathSegments.last;
      final objectId = database.fileNameMap[fileName];
      if (objectId != null) {
        //Removes the objectId from the potential orphans
        potentialOrphans.remove(objectId);
      }
    }
    return potentialOrphans;
  }
}
