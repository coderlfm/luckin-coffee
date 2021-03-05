import 'dart:ui';

/// 适配宽高
class SizeHot {
  /// 物理分辨率
  static late double physicalWidth;
  static late double physicalHeight;

  static late double dpr;

  static late double width;
  static late double height;

  static late double rpx;
  static late double px;

  static void initialize({double standardSize = 750}) {
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    dpr = window.devicePixelRatio;

    width = physicalWidth / dpr;
    height = physicalHeight / dpr;

    rpx = width / standardSize;
    px = width / standardSize * 2;
  }

  /// 设置 rpx
  static double setRpx(double size) => size * rpx;

  /// 设置 px
  static double setPx(double size) => size * px;
}
