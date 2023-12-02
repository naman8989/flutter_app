import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;

Future<dynamic> registerData() async {
  // var client = http.Client();
  print("--------------");
  var url = Uri.parse("http://13.233.98.126/");
  var body = await http.get(url);
  print("--------------");
  print(body);
}
