import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePAgeState();
}

class _ProfilePAgeState extends State<ProfilePage> {
  var nielsAvatorUrl =
      "https://media.licdn.com/dms/image/C4E03AQEqy87kjxv0Jg/profile-displayphoto-shrink_800_800/0/1581859194944?e=1687996800&v=beta&t=mWacwPHOrB_qaXhmnuqzrWpCy7QYPdyx8ozqI9LD3W4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [profileAvatarWidget(), userName(), Expanded(
          child: profileListView(),
          flex: 3,
        )],
      ),
    );
  }

  Widget profileAvatarWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: CircleAvatar(
          radius: 46,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.0),
            child: Image.network(nielsAvatorUrl),
          ),
        ),
      ),
    );
  }

  Widget userName() {
    TextStyle _style1 = GoogleFonts.montserrat(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);
    TextStyle _style2 = GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.grey.withOpacity(0.8),
        fontWeight: FontWeight.w600);

    return Column(
      children: [
        Text(
          "Niels Kragh Blume Dahl",
          style: _style1,
        ),
        Text(
          "Founder, EmpTech",
          style: _style2,
        )
      ],
    );
  }

  Widget profileListView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
      width: MediaQuery.of(context).size.width/1.1,
      height: MediaQuery.of(context).size.height/10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0), color: Color(0xfffafafa)),
    );
  }
}
