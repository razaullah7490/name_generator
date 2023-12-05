import 'package:flutter/widgets.dart';

class BottomNotifier{


static  ValueNotifier<int> bottomNavigationNotifier=ValueNotifier(0);
static PageController? bottomPageController;
static ValueNotifier<int> checkExitTimes=ValueNotifier(2);

}