import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/screen/screen_two/welcome_screen.dart';
import 'package:km_test/view_model/contact_list_view_model.dart';
import 'package:km_test/view_model/palindrome_view_model.dart';
import 'package:provider/provider.dart';

class PalindromeScreen extends StatelessWidget {
  const PalindromeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<PalindromeViewModel>(context, listen: false);
    final model = Provider.of<ContactListViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/ic_photo.png',
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              key: prov.formKey,
              controller: prov.name,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    'Name',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff686777).withOpacity(
                        0.36,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              key: prov.formKey1,
              controller: prov.palindrome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                alignLabelWithHint: true,
                label: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    'Palindrome',
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff686777).withOpacity(
                        0.36,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
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
                  prov.checkPalindrome(prov.palindrome.text.trim());
                  prov.isPalindrome
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ini Merupakan Palindrome'),
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ini Bukan Merupakan Palindrome'),
                          ),
                        );
                },
                child: Text(
                  'CHECK',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
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
                onPressed: () async {
                    await model.postDataToApi(
                      firstName: prov.name.text.trim(),
                      lastName: 'Doe',
                      avatar:
                          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmywaifulist.moe%2Fwaifu%2Fkageyama-tobio&psig=AOvVaw3ZihglgKIMpLi1rGSeVVKr&ust=1703869277667000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJCp1-3NsoMDFQAAAAAdAAAAABAD',
                      email: '${prov.name.text}@gmail.com',
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WelcomeScreen(),
                      ),
                    );
                  },
                // },
                child: Text(
                  'NEXT',
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
