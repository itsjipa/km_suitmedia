import 'package:flutter/material.dart';

class PalindromeViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final TextEditingController _palindrome = TextEditingController();
  final TextEditingController name = TextEditingController();
  bool _isPalindrome = false;

  TextEditingController get palindrome => _palindrome;
  bool get isPalindrome => _isPalindrome;

  set isPalindrome(bool value) {
    _isPalindrome = value;
    notifyListeners();
  }

  void checkPalindrome(String textPalindrome) {
    _isPalindrome = true;
    textPalindrome = textPalindrome.replaceAll(' ', '');
    String reverseKata = textPalindrome.split('').reversed.join();
    if (textPalindrome == reverseKata) {
      _isPalindrome = true;
    } else {
      _isPalindrome = false;
    }
    notifyListeners();
  }
}
