import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class GitHubUploader {
  final String username;
  final String repository;
  final String accessToken;

  GitHubUploader({
    required this.username,
    required this.repository,
    required this.accessToken,
  });

  // Function to upload a file to GitHub repository
  Future<void> uploadFile(String filePath, String commitMessage) async {
    var url = Uri.parse(
      'https://github.com/sunny31247/-Flutter10-Module-5-Assignment.git/github_uploader.dart',
    );

    // Read file and encode it in Base64
    var fileBytes = await File(filePath).readAsBytes();
    String base64FileContent = base64Encode(fileBytes);

    var headers = {
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/vnd.github.v3+json',
    };

    var body = jsonEncode({
      'message': commitMessage,
      'content': base64FileContent,
    });

    var response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('File uploaded successfully!');
    } else {
      print('Failed to upload file: ${response.statusCode}');
      print(response.body);
    }
  }
}
