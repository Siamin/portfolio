import 'dart:ui';

class ValueApp {
  final Size size;
  final bool isDesktop, isTablet, isPhone;

  ValueApp(
      {required this.size,
      this.isDesktop = false,
      this.isTablet = false,
      this.isPhone = false});

  calScreen() => (size.height + (isTablet ? size.width * 0.3 : size.width));

  /**
   * Title size
   */
  getTitleSizeH0() {
    if (isDesktop) return calScreen() * 0.05;
    if (isTablet) return calScreen() * 0.043;
    if (isPhone) return calScreen() * 0.030;

    return 0.0;
  }

  getTitleSizeH1() {
    if (isDesktop) return calScreen() * 0.03;
    if (isTablet) return calScreen() * 0.028;
    if (isPhone) return calScreen() * 0.025;

    return 0.0;
  }

  getTitleSizeH2() {
    if (isDesktop) return calScreen() * 0.014;
    if (isTablet) return calScreen() * 0.0085;
    if (isPhone) return calScreen() * 0.006;

    return 0.0;
  }
  getTitleSizeH3() {
    if (isDesktop) return calScreen() * 0.009;
    if (isTablet) return calScreen() * 0.007;
    if (isPhone) return calScreen() * 0.0065;

    return 0.0;
  }

  /**
   * Subtitle size
   */
  getSubtitleSizeH1() {
    if (isDesktop) return calScreen() * 0.014;
    if (isTablet) return calScreen() * 0.014;
    if (isPhone) return calScreen() * 0.012;

    return 0.0;
  }

  getSubtitleSizeH2() {
    if (isDesktop) return calScreen() * 0.013;
    if (isTablet) return calScreen() * 0.0125;
    if (isPhone) return calScreen() * 0.011;

    return 0.0;
  }

  getSubtitleSizeH3() {
    if (isDesktop) return calScreen() * 0.0085;
    if (isTablet) return calScreen() * 0.0075;
    if (isPhone) return calScreen() * 0.005;

    return 0.0;
  }

  getSubtitleSizeH4() {
    if (isDesktop) return calScreen() * 0.006;
    if (isTablet) return calScreen() * 0.005;
    if (isPhone) return calScreen() * 0.0045;

    return 0.0;
  }

  /**
   * Button size
   */
  getButtonSize() {
    if (isDesktop) return calScreen() * 0.01;
    if (isTablet) return calScreen() * 0.015;
    if (isPhone) return calScreen() * 0.0063;

    return 0.0;
  }

  /**
   * Padding
   */

  getPaddingSize(double padding) => calScreen() * (padding * 0.002);
  getImageSize(double size){
    if (isDesktop) return calScreen() * (size * 0.002);
    if (isTablet) return calScreen() * (size * 0.0015);
    if (isPhone) return calScreen() * (size * 0.001);
  }

  getBoxSize(){
    if (isDesktop) return calScreen() * 0.165;
    if (isTablet) return calScreen() * 0.15;
    if (isPhone) return calScreen() * 0.132;

    return 0.0;
  }
}
