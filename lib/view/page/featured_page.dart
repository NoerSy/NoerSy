import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myprofile_flutter/theme/platecolor.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({Key? key}) : super(key: key);

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {

  double getPaddingHorizontal(BoxConstraints constraints){
    if(constraints.minWidth < 1100){
      return 20.0;
    } else if (constraints.minWidth < 1400) {
      return 50.0;
    } else if (constraints.minWidth < 1400){
      return 100.0;
    } else{
      return 200.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: const EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(
            horizontal: getPaddingHorizontal(constraints),
            vertical: 100.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var item in List<int>.generate(constraints.minWidth < 1000 ? 1 : 1, (index) => index++))
                 ProjectCard(constraints: constraints,),
            ],
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 3,
            //   childAspectRatio: 1,
            //   mainAxisSpacing: 12.0,
            // ),
          ),
        );
      },
    );
  }
}

class ProjectCard extends StatefulWidget {
  final BoxConstraints constraints;
  const ProjectCard({Key? key, required this.constraints}) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final ScrollController _controller = ScrollController();
  double _offfset = 0.1;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (_) {
      if(_controller.position.atEdge) {
        setState(() => _offfset = 1.0);
      } else {
        setState(() => _offfset = _controller.offset + 270);
      }

      _controller.animateTo(_offfset, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
    super.initState();
  }

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
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Platecolor.bg2.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("${widget.constraints.minWidth}"),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Platecolor.bg2.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Scrollbar(
                  controller: _controller,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 8.0, right: 8.0, left: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      child: Row(
                        children: [
                          Image.asset('assets/images/ajari/1.png'),
                          Image.asset('assets/images/ajari/2.png'),
                          Image.asset('assets/images/ajari/3.png'),
                          Image.asset('assets/images/ajari/4.png'),
                          Image.asset('assets/images/ajari/5.png'),
                          Image.asset('assets/images/ajari/6.png'),
                          Image.asset('assets/images/ajari/7.png'),
                          Image.asset('assets/images/ajari/8.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
