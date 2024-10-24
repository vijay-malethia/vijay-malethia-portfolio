import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 100),
      builder: (context, value, child) {
        return
            // DefaultTextStyle(
            //     maxLines: 5,
            //     overflow: TextOverflow.ellipsis,
            //     style: GoogleFonts.poppins(
            //         color: primaryColor, wordSpacing: 2, fontSize: value),
            //     child: AnimatedTextKit(
            //       isRepeatingAnimation: false,
            //       totalRepeatCount: 0,
            //       animatedTexts: [
            //         TypewriterAnimatedText(
            //             "I'm a Flutter developer based in India, helping clients bring their ideas "
            //             "${!Responsive.isLargeMobile(context) ? '\n' : ''}"
            //             "to life by creating seamless mobile applications. From concept to deployment, "
            //             "${!Responsive.isLargeMobile(context) ? '\n' : ''}"
            //             "I ensure every step is handled with precision, resulting in efficient, "
            //             "user-friendly apps ${!Responsive.isLargeMobile(context) ? '\n' : ''}designed for an intuitive experience across devices."),
            //       ],
            //       onTap: () {},
            //     ));

            Text.rich(
          TextSpan(
            text: "I'm a ",
            style: GoogleFonts.poppins(
                color: Colors.white,
                wordSpacing: 2,
                letterSpacing: 0.2,
                height: 2,
                fontSize: value + 1),
            children: [
              TextSpan(
                text: 'Flutter developer ', // Word to style
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: value,
                ),
              ),
              const TextSpan(
                text: "based in ",
              ),
              TextSpan(
                text: "India, ",
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: value,
                ),
              ),
              const TextSpan(
                text: "helping clients bring their ideas ",
              ),
              if (!Responsive.isLargeMobile(context))
                const TextSpan(text: '\n'),
              const TextSpan(text: "to life by creating seamless"),
              TextSpan(
                text: " mobile applications",
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: value,
                ),
              ),
              const TextSpan(text: ". From concept to deployment, "),
              if (!Responsive.isLargeMobile(context))
                const TextSpan(text: '\n'),
              const TextSpan(
                  text:
                      "I ensure every step is handled with precision, resulting in efficient, "),
              const TextSpan(
                text: "user-friendly apps ",
              ),
              if (!Responsive.isLargeMobile(context))
                const TextSpan(text: '\n'),
              const TextSpan(text: "designed for an"),
              TextSpan(
                text: " intuitive ",
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: value,
                ),
              ),
              const TextSpan(text: "experience across devices."),
            ],
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
