import 'dart:io';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> urlToFile(String imageUrl) async {
  Directory tempDir = await getTemporaryDirectory();
  File file = File('${tempDir.path}${math.Random().nextInt(100)}.png');
  http.Response response = await http.get(Uri.parse(imageUrl));
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
