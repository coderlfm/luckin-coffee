import 'package:luckincoffee/shared/size-hot.dart';

extension IntRpx on int {
  double get rpx => SizeHot.setRpx(this.toDouble());

  double get px => SizeHot.setPx(this.toDouble());
}
