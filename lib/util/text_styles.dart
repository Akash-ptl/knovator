library my_prj.globals;

import 'package:flutter/material.dart';

import 'colors.dart';

class textStyle {
  static final TextStyle title =
      TextStyle(color: colorDark, fontWeight: FontWeight.bold, fontSize: 34);

  static final TextStyle titleBold =
      TextStyle(color: colorDark, fontWeight: FontWeight.w900, fontSize: 24);

  ///heading

  static final TextStyle headingLight =
      TextStyle(color: colorDark, fontSize: 32, fontFamily: 'MulishLight');
  static final TextStyle heading =
      TextStyle(color: colorDark, fontSize: 32, fontFamily: 'Mulish');
  static final TextStyle headingSemiBold = TextStyle(
      color: colorDark, fontSize: 32, fontFamily: 'MulishSemiBold');
  static final TextStyle headingBold =
      TextStyle(color: colorDark, fontSize: 32, fontFamily: 'MulishBold');
  static final TextStyle headingExtraBold = TextStyle(
      color: colorDark, fontSize: 32, fontFamily: 'MulishExtraBold');

  // static final TextStyle headingsemibold = TextStyle(
  //     color: colorDark,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 32,
  //     fontFamily: 'poppinssemibold');

  // static final TextStyle headingLight = TextStyle(
  //     color: colorDark,
  //     // fontWeight: FontWeight.w700,
  //     fontSize: 22,
  //     fontFamily: 'poppinslight');

  ///subheading
  // static final TextStyle subHeading = TextStyle(
  //     color: colorSubHeadingText,
  //     fontWeight: FontWeight.normal,
  //     fontSize: 16);
  static final TextStyle subHeadingLight = TextStyle(
      color: colorSubHeadingText, fontSize: 16, fontFamily: 'MulishLight');

  static final TextStyle subHeading = TextStyle(
      color: colorSubHeadingText, fontSize: 16, fontFamily: 'Mulish');

  static final TextStyle subHeadingColorDark = TextStyle(
      color: colorHeadingText, fontSize: 16, fontFamily: 'MulishBold');

  static final TextStyle subHeadingSemiBold = TextStyle(
      color: colorSubHeadingText,
      fontSize: 16,
      fontFamily: 'MulishSemiBold');

  static final TextStyle subHeadingBold = TextStyle(
      color: colorSubHeadingText, fontSize: 16, fontFamily: 'MulishBold');

  static final TextStyle subHeadingExtraBold = TextStyle(
      color: colorSubHeadingText,
      fontSize: 16,
      fontFamily: 'MulishExtraBold');

  // static final TextStyle subHeadingSemibold = TextStyle(
  //     color: colorSubHeadingText,
  //     fontFamily: 'poppinssemibold',
  //     fontWeight: FontWeight.normal,
  //     fontSize: 16);
  //
  // static final TextStyle subHeadingSemibold2 = TextStyle(
  //     color: colorSubHeadingText,
  //     fontFamily: 'poppinssemibold',
  //     fontWeight: FontWeight.normal,
  //     fontSize: 16);
  //
  // static final TextStyle subHeadingLigh = TextStyle(
  //     color: colorSubHeadingText,
  //     fontFamily: 'poppinslight',
  //     fontWeight: FontWeight.normal,
  //     fontSize: 16);

  // static final TextStyle subHeadingColorDark =
  //     subHeading.copyWith(color: colorHeadingText, fontWeight: FontWeight.bold);

  ///small text

  static final TextStyle smallTextLight = TextStyle(
      color: colorSubHeadingText, fontSize: 13, fontFamily: 'MulishLight');
  static final TextStyle smallText = TextStyle(
      color: colorSubHeadingText, fontSize: 13, fontFamily: 'Mulish');
  static final TextStyle smallTextColorDark = TextStyle(
      color: colorSubHeadingText, fontSize: 13, fontFamily: 'MulishBold');
  static final TextStyle smallTextSemiBold = TextStyle(
      color: colorSubHeadingText,
      fontSize: 13,
      fontFamily: 'MulishSemiBold');
  static final TextStyle smallTextBold = TextStyle(
      color: colorSubHeadingText, fontSize: 13, fontFamily: 'MulishBold');
  static final TextStyle smallTextExtraBold = TextStyle(
      color: colorSubHeadingText,
      fontSize: 13,
      fontFamily: 'MulishExtraBold');

  // static final TextStyle smallTextColorDark = TextStyle(
  //     color: colorSubHeadingText, fontWeight: FontWeight.bold, fontSize: 13);
  //
  // static final TextStyle smallTextSemiBoldDark = TextStyle(
  //     color: colorSubHeadingText,
  //     fontFamily: 'poppinssemibold',
  //     fontWeight: FontWeight.w500,
  //     fontSize: 13);
  //
  // static final TextStyle smallText = TextStyle(
  //     color: colorSubHeadingText,
  //     fontWeight: FontWeight.normal,
  //     fontSize: 13);
  //
  // static final TextStyle smallTextSemiBold = TextStyle(
  //     color: colorSubHeadingText,
  //     fontFamily: 'poppinssemibold',
  //     fontWeight: FontWeight.w300,
  //     fontSize: 13);
  //
  // static final TextStyle smallTextLight = TextStyle(
  //     color: colorSubHeadingText,
  //     fontFamily: 'poppinslight',
  //     fontWeight: FontWeight.normal,
  //     fontSize: 13);

  static final TextStyle button = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      fontFamily: 'Mulish');

  static final TextStyle subButton = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 14);
}
