//Registration of Buyer
import 'package:earthworm/Login_screen.dart';
import 'package:earthworm/buyerHomeScreen.dart';
import 'package:earthworm/reuseable_wigdet/reuseable_widget.dart';
import 'package:earthworm/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterBuyerScreen extends StatefulWidget {
  @override
  _RegisterBuyerScreenState createState() => _RegisterBuyerScreenState();
}

class _RegisterBuyerScreenState extends State<RegisterBuyerScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController companyNameTextController = TextEditingController();
  TextEditingController roleInSupplyTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  TextEditingController pincodeTextController = TextEditingController();

  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.reference().child('buyers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/Earthwormlogo.png"),
                SizedBox(height: 30),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  userNameTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Enter Email",
                  Icons.email,
                  false,
                  emailTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  passwordTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Name of Company",
                  Icons.work,
                  false,
                  companyNameTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Role in Supply Chain",
                  Icons.assignment,
                  false,
                  roleInSupplyTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Phone",
                  Icons.phone,
                  false,
                  phoneTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "City (Nearest Market)",
                  Icons.location_city,
                  false,
                  cityTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "State",
                  Icons.location_on,
                  false,
                  stateTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Pincode",
                  Icons.pin,
                  false,
                  pincodeTextController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
  onPressed: () async {
    try {
      //Saving Email and password to Firebase_Auth
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      //Saving the all remaining answer to Firebase Realtime Database
      databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'id': FirebaseAuth.instance.currentUser!.uid,
        'email': emailTextController.text,
        'username': userNameTextController.text,
        'companyName': companyNameTextController.text,
        'roleInSupply': roleInSupplyTextController.text,
        'phone': phoneTextController.text,
        'city': cityTextController.text,
        'state': stateTextController.text,
        'pincode': pincodeTextController.text,
        
      });

      print("Created New Account");

      // Show a success dialog to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Account created successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyerHomeScreen(),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (error) {
      print("Error occurred: $error");

      // Show an error dialog to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred during registration. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  },
  child: Text("Sign Up"),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
