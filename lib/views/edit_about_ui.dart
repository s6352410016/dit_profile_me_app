import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAboutUI extends StatefulWidget {
  const EditAboutUI({super.key});

  @override
  State<EditAboutUI> createState() => _EditAboutUIState();
}

class _EditAboutUIState extends State<EditAboutUI> {

  TextEditingController aboutCtrl = TextEditingController(text: '');

  Future saveAboutToSP() async{
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourabout', aboutCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          'Edit About แก้ไขเกี่ยวกับ',
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
              'Your about / เกี่ยวกับ',
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
                right: width_screen * 0.1,
              ),
              child: TextField(
                controller: aboutCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเกี่ยวกับของคุณ...',
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
              onPressed: () {
                if(aboutCtrl.text.trim().isEmpty){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                          style: GoogleFonts.kanit(),
                        ),
                        content: Text(
                          'กรุณาป้อนเกี่ยวกับด้วย',
                          style: GoogleFonts.kanit(),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ตกลง',
                              style: GoogleFonts.kanit(),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[800],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }else{
                  saveAboutToSP().then((value) => Navigator.pop(context));
                }
              },
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
