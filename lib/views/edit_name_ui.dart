import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditNameUI extends StatefulWidget {
  const EditNameUI({super.key});

  @override
  State<EditNameUI> createState() => _EditNameUIState();
}

class _EditNameUIState extends State<EditNameUI> {

  TextEditingController nameCtrl = TextEditingController(text: '');

  Future saveNameToSP() async{
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourname', nameCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {

    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          'Edit Name แก้ไขชื่อ',
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
              'Your name / ชื่อ',
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
                controller: nameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนชื่อของคุณ...',
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
                if(nameCtrl.text.trim().isEmpty){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                          style: GoogleFonts.kanit(),
                        ),
                        content: Text(
                          'กรุณาป้อนชื่อด้วย',
                          style: GoogleFonts.kanit(),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
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
                  saveNameToSP().then((value) => Navigator.pop(context));
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