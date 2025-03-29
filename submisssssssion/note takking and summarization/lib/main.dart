import 'package:flutter/material.dart';
import 'package:quicknotes/controller/note_provider.dart';
import 'package:quicknotes/views/UI/HomeScreen.dart';
import 'package:quicknotes/views/UI/addPage.dart';
import 'package:quicknotes/views/UI/settings.dart';
import 'package:quicknotes/views/UI/startPage.dart';
import 'package:quicknotes/views/UI/favouriteScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => NoteController(),
            ),
      ],
          child: MyApp()));
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light, primaryColor: Colors.deepPurple,
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => StartPage(navigatorKey: navigatorKey));
        } else if (settings.name == '/home') {
          return MaterialPageRoute(builder: (context) => homePage(navigatorKey: navigatorKey));
        } else if (settings.name == '/settings') {
          return MaterialPageRoute(builder: (context) => const SettingPage());
        } else if (settings.name == '/trash') {
          return MaterialPageRoute(builder: (context) => const TrashPage());
        }else if (settings.name == '/add') {
          return MaterialPageRoute(builder: (context) => AddPage());
        }

      },
      home: StartPage(navigatorKey: navigatorKey),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
