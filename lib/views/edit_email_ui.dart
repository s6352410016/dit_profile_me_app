import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditEmailUI extends StatefulWidget {
  const EditEmailUI({super.key});

  @override
  State<EditEmailUI> createState() => _EditEmailUIState();
}

class _EditEmailUIState extends State<EditEmailUI> {
  @override
  Widget build(BuildContext context) {

    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          'Edit Email แก้ไขอีเมล',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: width_screen * 0.2,
            ),
            Text(
              'Your email / อีเมล',
              style: GoogleFonts.kanit(
                fontSize: width_screen * 0.05,
              ),
            ),
            SizedBox(
              height: width_screen * 0.05,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width_screen * 0.1,
                right:  width_screen * 0.1,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนอีเมลของคุณ...',
                  hintStyle: GoogleFonts.kanit(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: width_screen * 0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'บันทึก',
                style: GoogleFonts.kanit(
                  fontSize: width_screen * 0.05,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  width_screen - width_screen * 0.1 * 2,
                  width_screen * 0.12,
                ),
                backgroundColor: Colors.purple[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}