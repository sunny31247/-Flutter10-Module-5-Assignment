import 'dart:io';
import 'package:flutter/material.dart';
import 'github_uploader.dart'; // Ensure this is the correct path where the GitHubUploader is defined.

void main() {
  // 1. Create Car and set speed
  Car car = Car();
  car.setSpeed(80);
  car.move();

  // 2. Upload a file to GitHub
  String filePath = 'path_to_your_file.txt'; // Replace with the actual file path
  String commitMessage = 'Uploading file from Flutter app';
  String username = 'your_github_username'; // Replace with your GitHub username
  String repository = 'your_repository_name'; // Replace with your GitHub repo name
  String accessToken = 'your_github_personal_access_token'; // Replace with your GitHub access token

  GitHubUploader uploader = GitHubUploader(
    username: username,
    repository: repository,
    accessToken: accessToken,
  );

  uploader.uploadFile(filePath, commitMessage);
}
