import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({Key? key}) : super(key: key);

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var item in List<int>.generate(3, (index) => index++))
            Center(child: Text("data : $item"))
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
