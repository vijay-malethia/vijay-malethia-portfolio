import 'package:flutter/material.dart';

class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return TweenAnimationBuilder(
          tween: Tween(begin: start, end: end),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.pink,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                'Vijay Malethia',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    fontSize: value),
              ),
            );
          },
        );
      },
    );
  }
}
