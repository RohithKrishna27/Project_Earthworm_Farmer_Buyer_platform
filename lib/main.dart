import 'package:earthworm/Login_screen.dart';
import 'package:earthworm/OrderSummaryScreen.dart';
import 'package:earthworm/FarmerHomeScreen.dart';
import 'package:earthworm/utils/color_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDh2JMWOb1fwemP2RdYs1rGxX9-Ru9ZZ3w',
      appId: '1:655191329472:android:ca5731c4a8174d68747b25',
      messagingSenderId: '655191329472',
      projectId: 'register-farmer-1e795',
    ),
  );
  print('Loading .env file...');
  await dotenv.load(fileName: 'assets/images/.env');
  print(dotenv.env);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earthworm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
          secondary: Colors.deepPurpleAccent,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => const Loginscreen(),

        '/farmerHome': (context) =>
            const FarmerHomeScreen(), 
      },
    );
  }
}
