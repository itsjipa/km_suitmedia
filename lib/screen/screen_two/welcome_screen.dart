import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/screen/screen_three/contact_list.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
            Text(
              'John Doe',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 300.0,
            ),
            Center(
              child: Text(
                'Selected User Name',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            const SizedBox(
              height: 300.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 41.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2B637B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ContactList(),
                    ),
                  );
                },
                child: Text(
                  'Choose a User',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
