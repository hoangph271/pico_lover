import 'package:http/http.dart' as http;
import 'constants.dart';

Future<String> sendPicoRequest(String url) async {
  final res = await http.get(Uri.http(apiRoot, url));

  return res.body;
}
