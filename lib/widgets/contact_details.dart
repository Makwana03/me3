import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.values,
          children: [
            SvgPicture.asset("assets/svg/twiter.svg"),
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
        const Text(
          "support@mp.gmail.com",
          style: TextStyle(fontFamily: 'mp'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "+60 825 876",
          style: TextStyle(fontFamily: 'mp'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "08:00 - 20:00 - Everyday",
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
