import 'package:earthworm/AboutUsScreen.dart';
import 'package:earthworm/BuyerHomeScreen.dart';
import 'package:earthworm/EarthWormFinanceScreen.dart';
import 'package:earthworm/Login_screen.dart';
import 'package:earthworm/SellCropScreen.dart';
import 'package:earthworm/WeView/InFarmScreen.dart';
import 'package:earthworm/WeView/WebViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:earthworm/RiseEarthwormScreen.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({Key? key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}
//styling

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EARTHWORM",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
                // Handle logout logic here
              }),
        ],
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
                      image: "assets/images/rise.png",
                      name: 'Earthworm RISE',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EarthwormRisePage()),
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
                      image: "assets/images/orderplacing.png",
                      name: 'Sell your Crop here',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CropSellScreen()),
                        );
                      },
                    ),
                    _FeaturesInEarthworm(
                      image: "assets/images/loanlogo.jpg",
                      name: 'Small Loans',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EarthwormFinance()),
                        );
                      },
                    ),
                    _FeaturesInEarthworm(
                      image: "assets/images/farm.jpg",
                      name: 'In-farm',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewListPage()),
                        );
                      },
                    ),
                    _FeaturesInEarthworm(
                      image: "assets/images/about-us-22.png",
                      name: 'About Us',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutEarthworm()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BottomRowOption(
                      image: "assets/images/orderplacing.png",
                      text: "Sell Your Crop",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CropSellScreen()),
                        );
                      },
                    ),
                    //Page Bottom Styling
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
