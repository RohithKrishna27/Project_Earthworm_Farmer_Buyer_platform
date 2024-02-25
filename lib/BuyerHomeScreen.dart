import 'package:earthworm/AboutUsScreen.dart';
import 'package:earthworm/EarthWormFinanceScreen.dart';
import 'package:earthworm/WeView/WebViewScreen.dart';
import 'package:earthworm/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({Key? key});

  @override
  State<BuyerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<BuyerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[400],
        title: Text(
          "EARTHWORM",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "HELLO User",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Welcome To EarthWorm",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Text(
                "Features of Earthworm",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.30,
                  children: [
                    _FeaturesInEarthworm(
                      image: "assets/images/about-us-22.png",
                      name: 'About us',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutEarthworm()),
                        );
                      },
                    ),
                    _FeaturesInEarthworm(
                      image: "assets/images/chatbotlogo.jpg",
                      name: 'Earthworm ChatBOT',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen()));
                      },
                    ),
                    _FeaturesInEarthworm(
                      image: "assets/images/buyerorderlogo.png",
                      name: 'Place Your Order',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()),
                        );
                      },
                    ),
                    _FeaturesInEarthworm(
                      image: "assets/images/loanlogo.jpg",
                      name: 'Earthworm Finance',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EarthwormFinance()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomRowOption(
                    image: "assets/images/buyerorderlogo.png",
                    text: "Place Your Order",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderScreen()),
                      );
                    },
                  ),
                  _BottomRowOption(
                    image: "assets/images/chatbotlogo.jpg",
                    text: "EarthWorm Chatbot",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewScreen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _FeaturesInEarthworm({
  required String image,
  required String name,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    ),
  );
}

Widget _BottomRowOption({
  required String image,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(text),
      ],
    ),
  );
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Center(
        child: Text("About Us Screen Content"),
      ),
    );
  }
}

class SellCropScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell Your Crop"),
      ),
      body: Center(
        child: Text("Sell Your Crop Screen Content"),
      ),
    );
  }
}

class SmallLoansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Small Loans"),
      ),
      body: Center(
        child: Text("Small Loans Screen Content"),
      ),
    );
  }
}
