import 'package:flutter/material.dart';

class NetWorkErrorHandling extends StatelessWidget {
  final int? statusCode;
  final VoidCallback onRetry;

  const NetWorkErrorHandling({Key? key, this.statusCode, required this.onRetry}) : super(key: key);

  String _getErrorMessage(int? statusCode) {
    switch (statusCode) {
      case 404:
        return "Resource not found. Please check the URL and try again.";
      case 500:
        return "Internal server error. Please try again later.";
      default:
        return "An error occurred. Please check your internet connection and try again.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.error,
            size: 80,
            color: Colors.red,
          ),
          const SizedBox(height: 20),
          Text(
            "Error ${statusCode ?? 'Unknown'}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _getErrorMessage(statusCode),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              "Retry",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
