import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_fashion__1/view/tabs.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});
  _launchURL() async {
    await canLaunchUrl(
      Uri.parse("https://www.instagram.com/rudraithub/?igsh=NHVjbGhjODZ6Z3Rx"),
    )
        ? await launchUrl(
            Uri.parse("https://www.instagram.com/rudraithub/?igsh=NHVjbGhjODZ6Z3Rx"),
          )
        : await launchUrl(
            Uri.parse(
                "https://www.instagram.com/rudraithub/?igsh=NHVjbGhjODZ6Z3Rx"),
          );

//    const  uri =
//               'https://stackoverflow.com/questions/76616046/how-to-navigate-user-to-another-app-on-his-device';
//               // final Uri url = Uri.parse(uri);
// //   if (!await canLaunchUrl(url)) {
// await launchUrl(url);
//   }

//   else{
//     print("Prashant");
//   }
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
                onTap: () {
                  // _launchURL();
                },
                child: SvgPicture.asset("assets/svg/twiter.svg")),
                 InkWell(
                onTap: () {
                  _launchURL();
                },
                child: SvgPicture.asset("assets/svg/instagram2.svg")),
            // SvgPicture.asset("assets/svg/instagram2.svg"),
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
          homePageCantroller.storeModel.value?.store.email ?? '',
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
          homePageCantroller.storeModel.value?.store.time ?? '',
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
