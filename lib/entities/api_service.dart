import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> registerOrganization({
    required String companyName,
    required String companyPhone,
    required String companyEmail,
    required String companyDesignation,
    required String companyAddress,
    required String zipCode,
    required String country,
    required String state,
    required String city,
  }) async {
    final String apiUrl = "http://65.0.70.110:8081/v1/organization/register";

    final Map<String, dynamic> requestBody = {
      "companyName": companyName,
      "companyPhone": companyPhone,
      "companyEmail": companyEmail,
      "companyDesignation": companyDesignation,
      "companyAddress": companyAddress,
      "zipCode": zipCode,
      "country": country,
      "state": state,
      "companyArea": city,
      "dbUrl": null,
      "customerId":null
      // Add other fields from your request body as needed
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json","Accept": "application/json",},
        body: jsonEncode(requestBody),
      );
      print("Request Body: ${jsonEncode(requestBody)}");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201) {
        // Successful API call, return the response data
        final responseData = jsonDecode(response.body);
        print("Response data: $responseData");
        return responseData;
      } else {
        // Handle error cases
        print("API Call failed with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception("API Call failed");
      }
    } catch (e) {
      // Handle exceptions
      print("Exception during API call: $e");
      throw Exception("API Call failed");
    }
  }
}
