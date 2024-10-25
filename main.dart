import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  String nida = "Your nida";
  String apiKey = "Your api key"; // not important
  String token = "Your token";    // not important
  String accountId = "Your account id";

  String url = 'https://kabukukidigitali.xyz/nida/api/index.php';

  // Headers
  Map<String, String> headers = {
    'api-key': apiKey,
    'token': token,
    'account_id': accountId,
    'Content-Type': 'application/json',
  };

  // Body
  Map<String, dynamic> body = {
    'nida': nida,
  };

  try {
    // Sending POST request
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Parse response as JSON
      var data = jsonDecode(response.body);
      print("Response data: $data");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  } catch (e) {
    print("An error occurred: $e");
  }
}
