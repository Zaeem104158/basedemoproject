import 'package:baseproj/common_widget/custome_text.dart';
import 'package:flutter/material.dart';
import '../../../core/color/app_colors.dart';

class CustomeDialogBox extends StatefulWidget {
  const CustomeDialogBox({super.key});

  @override
  CustomeDialogBoxState createState() => CustomeDialogBoxState();
}

class CustomeDialogBoxState extends State<CustomeDialogBox>
    with TickerProviderStateMixin {
  double fillPercent = 0.0; // Fill percentage (0.0 to 1.0)
  late AnimationController _controller; // Controls the animation
  late Animation<double> _animation; // Drives the tween animation
  late AnimationController animationGradientController;
  late Animation<Alignment> topLeftAnimation;
  late Animation<Alignment> bottomRightAnimation;
  @override
  void initState() {
    super.initState();

    animationGradientController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    topLeftAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1)
    ]).animate(animationGradientController);

    bottomRightAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1)
    ]).animate(animationGradientController);

    // animationGradientController.repeat();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Time to fully fill the container
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {
          fillPercent = _animation.value;
        });
      });
  }

  void _startFilling() {
    _controller.forward(); // Start filling animation
    animationGradientController.forward();
  }

  void _stopFilling() {
    if (fillPercent < 1) {
      _controller.reverse();
      animationGradientController.reverse();
    } else {
      _controller.stop();
      animationGradientController.stop();
    }
    // Reverse the animation when the tap stops
  }

  // void _resetFilling() {
  //   _controller.reset();
  //   animationGradientController.reset(); // Reset the animation to 0%
  //   setState(() {
  //     fillPercent = 0.0;
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose(); // Clean up animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationGradientController,
      builder: (context, _) {
        return Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              fillPercent > 0 && fillPercent < 1
                  ? AppColors.errorColor
                  : AppColors.blackColor,
              Colors.black,
            ], begin: topLeftAnimation.value, end: bottomRightAnimation.value),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              decoration: BoxDecoration(
                //color: Color(0xFF1d1d1d),
                color: Color.lerp(
                    const Color(0xFF1d1d1d),
                    const Color(0xFF531f21),
                    fillPercent != 1 ? fillPercent : 0), // Interpolate color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF531f21),
                    child: Icon(Icons.warning),
                  ),
                  CustomeText(
                    text: "Are you sure you want to delete?",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.whiteColor),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTapDown: (_) {
                      _startFilling(); // Start animation on tap
                    },
                    onTapUp: (_) {
                      _stopFilling(); // Pause animation on release
                    },
                    onTapCancel: () {
                      _stopFilling(); // Pause animation if tap is canceled
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 198,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: const [Colors.red, Color(0xFF531f21)],
                            stops: [
                              fillPercent,
                              fillPercent
                            ], // Control gradient fill
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: CustomeText(
                          text: "Press and hold for delete",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
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
