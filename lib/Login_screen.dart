import 'package:earthworm/AboutUsScreen.dart';
import 'package:earthworm/BuyerHomeScreen.dart';
import 'package:earthworm/Register_has_Farmer_screen.dart';
import 'package:earthworm/Register_has_buyer_screen.dart';
import 'package:earthworm/SellCropScreen.dart';
import 'package:earthworm/EarthWormFinanceScreen.dart';
import 'package:earthworm/WeView/InFarmScreen.dart';
import 'package:earthworm/farmerHomeScreen.dart';
import 'package:earthworm/orderScreen.dart';
import 'package:earthworm/reuseable_wigdet/reuseable_widget.dart';
import 'package:earthworm/uploadPhoto/UploadPhoto.dart';
import 'package:earthworm/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("4CAF50"),
              hexStringToColor("8BC34A"),
              hexStringToColor("8BC34A"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logoWidget("assets/images/Earthwormlogo.png"),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      reusableTextField(
                        "Enter Email",
                        Icons.email,
                        false,
                        _emailTextController,
                      
                      ),
                      SizedBox(height: 30),
                      reusableTextField(
                        "Enter Password",
                        Icons.lock_outline,
                        true,
                        _passwordTextController,
                     
                      ),
                    ],
                  ),
                ),
                signInSignUpButton(context, true, () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform Firebase login logic
                    try {
                      UserCredential userCredential =
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );

                      // If login is successful, navigate to AboutUsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FarmerHomeScreen()),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                        // Handle incorrect email or password
                        print('Invalid email or password');
                      } else {
                        // Handle other exceptions
                        print('Error: $e');
                      }
                    }
                  }
                }),
                registrationButtons(context, RegisterFarmerScreen(), RegisterBuyerScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container registrationButtons(BuildContext context, Widget farmerSignUp, Widget buyerSignUp) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            'New Member?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              

      
            ),
          ),
          const SizedBox(height: 10), // Add some space between text and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => farmerSignUp)));
                  },
                  child: const Text(
                    'Register as Farmer',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return Colors.white;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => buyerSignUp)));
                  },
                  child: const Text(
                    'Register as Buyer',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return Colors.white;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

