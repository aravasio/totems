import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

// OCR functionality using the Tesseract library.
class OCRService {
  // Performs OCR on the provided image path and returns the recognized text.
  static Future<String> performOCR(String imagePath) async {
    final String result = await FlutterTesseractOcr.extractText(imagePath);
    return result;
  }
}
