import 'package:flutter/cupertino.dart';
import 'package:quick_actions/quick_actions.dart';

class InAppQuickActions extends ChangeNotifier {
  String? shortcut;
  bool loading = false;

  InAppQuickActions._();

  static InAppQuickActions? _i;

  static InAppQuickActions get i => _i ??= InAppQuickActions._();

  void _handle(String shortcut) {
    switch (shortcut) {
      case "action_one":
        return _handleOne();
      case "action_two":
        return _handleTwo();
    }
  }

  void _handleOne() {
    // SHORTCUT ONE IS SELECTED
    shortcut = "action_one";
    notifyListeners();
  }

  void _handleTwo() async {
    // SHORTCUT TWO IS SELECTED
    shortcut = "action_two";
    loading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    loading = false;
    notifyListeners();
  }

  void _handleReady(dynamic) {
    // SHORTCUTS ARE READY
    shortcut = "Shortcut ready";
    notifyListeners();
  }

  Future<void> _init() async {
    const QuickActions quickActions = QuickActions();
    await quickActions.initialize(_handle);
    return quickActions.setShortcutItems([
      const ShortcutItem(
        type: 'action_one',
        localizedTitle: 'Action one',
        localizedSubtitle: 'Action one subtitle',
        icon: 'AppIcon',
      ),
      const ShortcutItem(
        type: 'action_two',
        localizedTitle: 'Action two',
        icon: 'ic_launcher',
      ),
    ]).then(_handleReady);
  }

  static Future<void> init() => i._init();
}
