import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_structure/Presentation/Screens/History/Model/history_model.dart';
import 'package:flutter_code_structure/Data/repositories/api_service.dart';


class HistoryProvider with ChangeNotifier {
  ApiService apiService = ApiService();

  List<String> categoryList = [
    "Speech to text",
    "Text to translation",
    "Scan QR code",
    "Change image extension",
    "Change video extension",
    "PDF to word",
    "Word to PDF",
    "Image to PDF",
    "Image to text",
  ];
}
