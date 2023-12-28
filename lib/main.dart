import 'package:flutter/material.dart';
import 'package:km_test/screen/screen_one/palindrome.dart';
import 'package:km_test/view_model/contact_list_view_model.dart';
import 'package:km_test/view_model/palindrome_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PalindromeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContactListViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PalindromeScreen(),
      ),
    );
  }
}
