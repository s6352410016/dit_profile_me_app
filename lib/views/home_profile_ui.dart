import 'package:dit_profile_me_app/views/edit_about_ui.dart';
import 'package:dit_profile_me_app/views/edit_email_ui.dart';
import 'package:dit_profile_me_app/views/edit_name_ui.dart';
import 'package:dit_profile_me_app/views/edit_phone_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
              ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: width_screen * 0.4,
                  height: width_screen * 0.4,
                  fit: BoxFit.cover,
                ),
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
                    );
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
                    );
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
                    );
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
                    );
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
