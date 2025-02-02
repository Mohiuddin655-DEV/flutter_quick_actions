import 'package:flutter/material.dart';
import 'package:flutter_quick_actions/quick_actions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InAppQuickActions.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Actions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Actions"),
      ),
      body: ListenableBuilder(
        listenable: InAppQuickActions.i,
        builder: (context, child) {
          final loading = InAppQuickActions.i.loading;
          final shortcut = InAppQuickActions.i.shortcut;
          return Center(
            child: loading
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      shortcut ?? "No shortcut selected",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
