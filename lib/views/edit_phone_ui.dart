import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPhoneUI extends StatefulWidget {
  const EditPhoneUI({super.key});

  @override
  State<EditPhoneUI> createState() => _EditPhoneUIState();
}

class _EditPhoneUIState extends State<EditPhoneUI> {

  TextEditingController phoneCtrl = TextEditingController(text: '');

  Future savePhoneToSP() async{
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourphone', phoneCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {

    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          'Edit Phone แก้ไขเบอร์โทรศัพท์',
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
              'Your phone / เบอร์โทรศัพท์',
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
                controller: phoneCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเบอร์โทรศัพท์ของคุณ...',
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
                if(phoneCtrl.text.trim().isEmpty){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                          style: GoogleFonts.kanit(),
                        ),
                        content: Text(
                          'กรุณาป้อนเบอร์โทรศัพท์ด้วย',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ตกลง',
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
                  savePhoneToSP().then((value) => Navigator.pop(context));
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