import 'package:luckincoffee/shared/size-hot.dart';

extension DoubleRpx on double {
  double get rpx => SizeHot.setRpx(this.toDouble());

  double get px => SizeHot.setPx(this.toDouble());
}
