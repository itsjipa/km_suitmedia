import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/model/api_model.dart';
import 'package:km_test/view_model/contact_list_view_model.dart';
import 'package:provider/provider.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ContactListViewModel>(context, listen: false)
        .fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ContactListViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
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
      body: FutureBuilder(
        future: prov.fetchDataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Data Tidak Ada'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: contactList(
                prov.apiModel!.data!,
              ),
            );
          }
        },
      ),
    );
  }

  Widget contactList(List<Data> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final datas = data[index];
        debugPrint('${data.length}');
        return GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 49,
                    height: 49,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        35.0,
                      ),
                      child: Image(
                        image: NetworkImage(
                          '${datas.avatar}',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${datas.firstName} ${datas.lastName}',
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        '${datas.email}',
                        style: GoogleFonts.poppins(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff686777)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(
                thickness: 0.5,
                height: 0.2,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
