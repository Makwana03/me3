import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion__1/view/tabs.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});
_launchURL() async {
   const  uri = 
              'https://sites.google.com/view/www-formwalagujarat-com/home';
              final Uri url = Uri.parse(uri);
  if (await canLaunchUrl(url)) {
    throw Exception('Could not launch ');
  }
  else{

  }
}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.values,
          children: [
            InkWell(
              onTap: (){
                 
          _launchURL();
              },
              child: SvgPicture.asset("assets/svg/twiter.svg")),
            SvgPicture.asset("assets/svg/instagram2.svg"),
            SvgPicture.asset("assets/svg/yt.svg"),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SvgPicture.asset(
          "assets/svg/5.svg",
        ),
        const SizedBox(
          height: 15,
        ),
         Text(
          homePageCantroller.storeModel.value?.store.email ??'',
          style: TextStyle(fontFamily: 'mp'),
        ),
        const SizedBox(
          height: 10,
        ),
         Text(
          homePageCantroller.storeModel.value?.store.phone ?? '',
          style: TextStyle(fontFamily: 'mp'),
        ),
        const SizedBox(
          height: 10,
        ),
         Text(
        homePageCantroller.storeModel.value?.store.time  ?? ''  ,
          style: TextStyle(fontFamily: 'mp'),
        ),
        const SizedBox(
          height: 10,
        ),
        SvgPicture.asset(
          "assets/svg/5.svg",
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.values,
          children: [
            Text(
              "About",
              style: TextStyle(fontFamily: 'mp'),
            ),
            Text(
              "Contact",
              style: TextStyle(fontFamily: 'mp'),
            ),
            Text(
              "Blog",
              style: TextStyle(fontFamily: 'mp'),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
