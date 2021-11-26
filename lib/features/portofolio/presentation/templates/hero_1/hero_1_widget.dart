import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/core/animations/entranceFader.dart';
import 'package:portofolio/core/base/screen/base_stateless.dart';
import 'package:portofolio/core/shared_widget/adaptiveText.dart';
import 'package:portofolio/core/theme/font_style.dart';
import 'package:portofolio/core/theme/themes.dart';
import 'package:portofolio/features/portofolio/data/models/hero_model.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Hero1Widget extends BaseStateless {
  const Hero1Widget(this.header, {Key? key}) : super(key: key);

  static String templateId = "header_1";
  final HeroModel header;

  @override
  Widget body(context) {
    return SizedBox(
      height: Get.height - 50,
      width: Get.width,
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        rowPadding: const EdgeInsets.all(30),
        columnPadding: const EdgeInsets.all(30),
        layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AdaptiveText(
                      header.title,
                      style: Styles.headlineSecondaryTextStyle,
                    ),
                    // EntranceFader(
                    //   offset: Offset(0, 0),
                    //   delay: Duration(seconds: 2),
                    //   duration: Duration(milliseconds: 800),
                    //   child: Image.asset(
                    //     "assets/hi.gif",
                    //     height: height * 0.05,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AdaptiveText(
                  header.firstName,
                  style: Styles.headlineTextStyle,
                ),
                AdaptiveText(
                  header.lastName,
                  style: Styles.headlineTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Themes.kPrimaryColor,
                      ),
                      TyperAnimatedTextKit(
                        isRepeatingAnimation: true,
                        speed: const Duration(milliseconds: 50),
                        textStyle: Styles.headlineSecondaryTextStyle,
                        text: header.roles,
                      ),
                    ],
                  ),
                ),

                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: List.generate(
                //     kSocialIcons.length,
                //     (index) => WidgetAnimator(
                //       child: SocialMediaIconBtn(
                //         icon: kSocialIcons[index],
                //         socialLink: kSocialLinks[index],
                //         height: Get.height * 0.035,
                //         horizontalPadding: (context) * 0.005,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: EntranceFader(
              offset: const Offset(0, 0),
              delay: const Duration(seconds: 1),
              duration: const Duration(milliseconds: 800),
              child: CachedNetworkImage(
                imageUrl: header.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
