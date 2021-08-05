import 'package:flutter/material.dart';
import 'package:ui_challange_travel_info_app/constants.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _TopText(),
            _DesertContainer(),
          ],
        ),
      ),
    );
  }
}

class _TopText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'The three largest \n deserts in the world',
              style: TextStyle(
                fontSize: 30,
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: const [
                Icon(
                  Icons.filter_hdr,
                  color: kPinkColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 16,
                    color: kPinkColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DesertContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180,
      left: 25,
      right: 40,
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/sahara1.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(5),
        child: const Text(
          'Sahara',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
