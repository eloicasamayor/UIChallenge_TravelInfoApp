import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ui_challange_travel_info_app/constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeInOutCirc,
        parent: animationController,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggleAnimation() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleAnimation();
        },
      ),
      body: SafeArea(
        child: ListenableProvider.value(
          value: animation,
          child: Stack(
            children: [
              _TopText(),
              _DesertContainer(),
              _SquareButton(),
              _VerticalDots(),
              _ArrowLines(),
              _IconRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Animation<double>>(
      builder: (context, animation, child) {
        return Positioned(
          top: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The three largest \ndeserts in the world ${animation.value}',
                  style: TextStyle(
                    fontSize: 30 - 5 * animation.value,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (child != null) child,
              ],
            ),
          ),
        );
      },
      child: Row(
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
      ),
    );
  }
}

class _DesertContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<Animation<double>>(
      builder: (context, animation, child) {
        return Positioned(
          top: 150 - 10 * animation.value,
          left: 35 + 30.0 * animation.value,
          right: 40 * (1 - animation.value),
          child: Container(
            width: 90,
            height: 90 + screenSize.height * 0.35 * animation.value,
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
      },
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Animation<double>>(
      builder: (context, animation, child) {
        return Positioned(
          top: 180 - 70 * animation.value,
          right: 20,
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(
                    -10 * (1 - animation.value), -10 * (1 - animation.value)),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VerticalDots extends StatelessWidget {
  const _VerticalDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Animation<double>>(
      builder: (context, animation, child) {
        return Positioned(
          top: 280,
          left: 20,
          child: FadeTransition(
            opacity: animation,
            child: Column(
              children: [
                _CircleDot(selected: true),
                SizedBox(
                  height: 5 + 15 * animation.value,
                ),
                _CircleDot(),
                SizedBox(
                  height: 5 + 15 * animation.value,
                ),
                _CircleDot(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CircleDot extends StatelessWidget {
  final bool selected;
  const _CircleDot({
    Key? key,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 20,
      width: 20,
      decoration: selected
          ? BoxDecoration(
              border: Border.all(
                color: kLightGreyColor,
              ),
              shape: BoxShape.circle,
              //color: Colors.grey,
            )
          : null,
      child: const CircleAvatar(
        backgroundColor: kLightGreyColor,
      ),
    );
  }
}

class _ArrowLines extends StatelessWidget {
  const _ArrowLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Animation<double>>(
      builder: (context, animation, child) {
        return Positioned(
          top: 525,
          left: 66,
          child: FadeTransition(
            opacity: animation,
            child: Container(
              width: 150,
              height: 2,
              child: Row(
                children: [
                  SizedBox(
                    width: 60 - 60 * animation.value,
                  ),
                  Expanded(
                    child: Container(
                      color: kDarkGreyColor,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      color: kDarkGreyColor,
                    ),
                  ),
                  SizedBox(
                    width: 60 - 60 * animation.value,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _IconRow extends StatelessWidget {
  const _IconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Animation<double>>(
      builder: (context, animation, child) {
        return Positioned(
          top: 600,
          left: 70,
          child: Row(
            children: [
              const Icon(
                Icons.map,
                size: 30,
                color: kDarkGreyColor,
              ),
              SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.sailing,
                size: 30,
                color: kDarkGreyColor,
              ),
              SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.baby_changing_station,
                size: 30,
                color: kDarkGreyColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
