import 'dart:io';

import 'package:dit_profile_me_app/views/edit_about_ui.dart';
import 'package:dit_profile_me_app/views/edit_email_ui.dart';
import 'package:dit_profile_me_app/views/edit_name_ui.dart';
import 'package:dit_profile_me_app/views/edit_phone_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProfileUI extends StatefulWidget {
  const HomeProfileUI({super.key});

  @override
  State<HomeProfileUI> createState() => _HomeProfileUIState();
}

class _HomeProfileUIState extends State<HomeProfileUI> {

  String your_name = 'Your name ... ???';
  String your_email = 'Your email ... ???';
  String your_phone = 'Your phone ... ???';
  String your_about = 'Your about ... ???';

  File? imageProfile;

  Future checkAndShowFromSP() async{
    SharedPreferences prefer = await SharedPreferences.getInstance();
    // ตรวจสอบว่ามีการเก็บ key รึยัง
    bool yourNameKey = prefer.containsKey('yourname'); 
    bool yourEmailKey = prefer.containsKey('youremail'); 
    bool yourPhoneKey = prefer.containsKey('yourphone'); 
    bool yourAboutKey = prefer.containsKey('yourabout'); 
    bool yourImage = prefer.containsKey('yourimage'); 
    
    if(yourNameKey && yourEmailKey && yourPhoneKey && yourAboutKey && yourImage){
      setState(() {
        your_name = prefer.getString('yourname')!;
        your_email = prefer.getString('youremail')!;
        your_phone = prefer.getString('yourphone')!;
        your_about = prefer.getString('yourabout')!;
        imageProfile = File(prefer.getString('yourimage')!);
      });
    }
  }

  getImageFromCameraAndSaveToSP() async{
    // เปิดกล้องถ่ายรูป
    XFile? pickImage = await ImagePicker().pickImage(source: ImageSource.camera);

    // ตรวจสอบว่ามีการถ่ายรูปยัง
    if(pickImage != null){
      setState(() {
        imageProfile = File(pickImage.path);
      });
    }else{
      return;
    }

    // บันทึกเก็บลงในเครื่อง
    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File localImage = await File(pickImage.path).copy('${imagePath}/${imageName}');

    // บันทึกที่อยู่ของรูปลง sharedpreferences
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', localImage.path);
  } 

  getImageFromGalleryAndSaveToSP() async{
    // เปิดแกลอรี่
    XFile? pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    // ตรวจสอบว่ามีรูปที่ถ่ายยัง
    if(pickImage != null){
      setState(() {
        imageProfile = File(pickImage.path);
      });
    }else{
      return;
    }

    // บันทึกรูปที่เลือกลงในเครื่อง
    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File localImage = await File(pickImage.path).copy('${imagePath}/${imageName}');

    // บันทึกที่อยู่ของรูปลง sharedpreferences
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', localImage.path);
  }

  @override
  void initState() {
    checkAndShowFromSP();  
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width_screen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          'DTI PROFILE ME',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: width_screen * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  imageProfile == null
                  ? ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: width_screen * 0.4,
                      height: width_screen * 0.4,
                      fit: BoxFit.cover,
                    ),
                  )
                  : ClipOval(
                    child: Image.file(
                      imageProfile!,
                      width: width_screen * 0.4,
                      height: width_screen * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getImageFromCameraAndSaveToSP();
                    },
                    child: Icon(
                      FontAwesomeIcons.camera,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width_screen * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width_screen * 0.05,
                  right: width_screen * 0.05,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNameUI(),
                      ),
                    ).then((value) => checkAndShowFromSP());
                  },
                  leading: Icon(
                    FontAwesomeIcons.person,
                    color: Colors.grey[800],
                  ),
                  title: Text(
                    'Name',
                    style: GoogleFonts.kanit(),
                  ),
                  subtitle: Text(
                    your_name,
                    style: GoogleFonts.kanit(
                      color: Colors.purple[800],
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width_screen * 0.05,
                  right: width_screen * 0.05,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEmailUI(),
                      ),
                    ).then((value) => checkAndShowFromSP());
                  },
                  leading: Icon(
                    Icons.email,
                    color: Colors.grey[800],
                  ),
                  title: Text(
                    'Email',
                    style: GoogleFonts.kanit(),
                  ),
                  subtitle: Text(
                    your_email,
                    style: GoogleFonts.kanit(
                      color: Colors.purple[800],
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width_screen * 0.05,
                  right: width_screen * 0.05,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPhoneUI(),
                      ),
                    ).then((value) => checkAndShowFromSP());
                  },
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.grey[800],
                  ),
                  title: Text(
                    'Phone',
                    style: GoogleFonts.kanit(),
                  ),
                  subtitle: Text(
                    your_phone,
                    style: GoogleFonts.kanit(
                      color: Colors.purple[800],
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width_screen * 0.05,
                  right: width_screen * 0.05,
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAboutUI(),
                      ),
                    ).then((value) => checkAndShowFromSP());
                  },
                  leading: Icon(
                    FontAwesomeIcons.personBurst,
                    color: Colors.grey[800],
                  ),
                  title: Text(
                    'About',
                    style: GoogleFonts.kanit(),
                  ),
                  subtitle: Text(
                    your_about,
                    style: GoogleFonts.kanit(
                      color: Colors.purple[800],
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
