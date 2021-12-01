import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/costume_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF161853),
            ),
          ),
          Positioned(
            width: 1000,
            height: 90,
            top: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("#Home", style: Theme.of(context).textTheme.subtitle1),
                Text("#Featured_Works", style: Theme.of(context).textTheme.subtitle1),
                Text("#Playground", style: Theme.of(context).textTheme.subtitle1),
                Text("#About", style: Theme.of(context).textTheme.subtitle1),
                Text("#Contact", style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello,",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                  "I’m Nur Syahfei",
                  style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 8.0),
              Text(
                "Freelance Designer, specialized in UI/UX.",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
              ),
              Row(
                children: [
                  Icon(CostumeIcons.twitter),
                  Icon(CostumeIcons.github),
                  Icon(CostumeIcons.linkedin),
                  Icon(CostumeIcons.instagram),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
