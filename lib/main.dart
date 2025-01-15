import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

// First, add the quick_actions package to pubspec.yaml
// dependencies:
//   quick_actions: ^1.0.5

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final QuickActions quickActions = const QuickActions();
  String shortcutItem = 'no action set';

  @override
  void initState() {
    super.initState();
    initializeQuickActions();
  }

  void initializeQuickActions() {
    quickActions.initialize((shortcutType) {
      // Handle quick action selection here
      setState(() {
        shortcutItem = shortcutType;
      });

      // Navigate based on the action selected
      switch (shortcutType) {
        case 'action_search':
          Navigator.pushNamed(context, '/search');
          break;
        case 'action_new_item':
          Navigator.pushNamed(context, '/new');
          break;
        case 'action_messages':
          Navigator.pushNamed(context, '/messages');
          break;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'action_search',
        localizedTitle: 'Search',
        icon: 'search', // Icon file name in Android/iOS project
      ),
      const ShortcutItem(
        type: 'action_new_item',
        localizedTitle: 'New Item',
        icon: 'add',
      ),
      const ShortcutItem(
        type: 'action_messages',
        localizedTitle: 'Messages',
        icon: 'message',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quick Actions Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Last Quick Action: $shortcutItem'),
              // Your app content here
            ],
          ),
        ),
      ),
    );
  }
}
