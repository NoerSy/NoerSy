import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/platecolor.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({Key? key}) : super(key: key);

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var item in List<int>.generate(1, (index) => index++))
            const ProjectCard()
        ],
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 3,
        //   childAspectRatio: 1,
        //   mainAxisSpacing: 12.0,
        // ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Platecolor.bg2.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Text("data")
          ],
        ),
      ),
    );
  }
}
