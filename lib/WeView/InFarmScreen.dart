
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


void main() {
  runApp(MaterialApp(
    home: WebViewListPage(),
  ));
}

class WebViewListPage extends StatelessWidget {
  final List<Map<String, String>> urlInfoList = [
    {
      'title':
          'RASTRIYA KRUSHI VIKASH YOJANA (government of inadia schemes on oraginc formaing) | In-Farm',
      'url': 'https://koraput.nic.in/schemes-agri/'
    },
    {
      'title':
          'PRADHAN MANTRI KISAN SAMMAN SCHEME (government scheme) | In-Farm',
      'url':
          'https://r.search.yahoo.com/_ylt=AwrKBHF1V9NlfvEYhna7HAx.;_ylu=Y29sbwNzZzMEcG9zAzIEdnRpZAMEc2VjA3Ny/RV=2/RE=1708378101/RO=10/RU=https%3a%2f%2fwww.myscheme.gov.in%2fschemes%2fpm-kisan/RK=2/RS=X_NEjPKiQ_ZHP9avNFvxzCxgYMg-'
    },
    {
      'title': 'Drip-irrigation | In-Farm',
      'url':
          'https://web.uri.edu/safewater/protecting-water-quality-at-home/sustainable-landscaping/drip-irrigation/'
    },
    {
      'title': 'organic-Farming | In-Farm',
      'url': 'https://www.britannica.com/topic/organic-farming'
    },
    {
      'title':
          'Pradhan Mantri Fasal Bima Yojana (PMFBY) , govenment scheme | In-Farm',
      'url':
          'https://krishijagran.com/agriculture-world/pradhan-mantri-fasal-bima-yojana-crop-insurance-premium-likely-to-change-in-pmfby-20/'
    },
    {
      'title':
          'Farmer protest 2024 update fab-29 (delhi chalo march) | In-Farm',
      'url':
          'https://r.search.yahoo.com/_ylt=AwrKABKAWdNlt9UaAXO7HAx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3Ny/RV=2/RE=1708378624/RO=10/RU=https%3a%2f%2fwww.thehindu.com%2fnews%2fnational%2ffarmers-protest-2024-live-updates-feb-19-2024%2farticle67862517.ece/RK=2/RS=b6qLuIJJwzyArHBAza4RWli3y14-'
    },
    {
      'title': 'Sustainability in Indian agriculture | In-Farm ',
      'url':
          'https://r.search.yahoo.com/_ylt=Awrx.f6qWtNlGWMbkBO7HAx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3Nj/RV=2/RE=1708378923/RO=10/RU=http%3a%2f%2fwww.firstpost.com%2fbusiness%2fsustainability-as-a-solution-to-sustain-indian-agriculture-in-times-to-come-13736182.html/RK=2/RS=Asm_prZAQ33oh.y1Ri.KdizQ9zc-'
    },
    {
      'title':
          'Drones , robots and super sperm - are future of farming | In-Farm',
      'url':
          'https://in.video.search.yahoo.com/search/video;_ylt=Awrx.f6qWtNlGWMbpBO7HAx.;_ylu=Y29sbwNzZzMEcG9zAzMEdnRpZAMEc2VjA3Nj?p=latest+technology+used+in+farming&type=E210IN885G0&ei=UTF-8&fr=mcafee&turl=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOVP.03_om053ZA7VH2ENrMFpiAHgFo%26pid%3DApi%26w%3D296%26h%3D156%26c%3D7%26p%3D0&rurl=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DqwNVNE83Udo&tit=Drones%2C+robots%2C+and+super+sperm+%E2%80%93+the+future+of+farming+%7C+DW+Documentary+%28Farming+documentary%29&pos=2&vid=e8c4e98955d40743ebbdf6735e46f338&sigr=Y9EGvp12rN.K&sigt=NunUas9NOpWq&sigi=AAizWJqbrFOW'
    },
    {
      'title': 'know more technology on farming - Crop Science | In-Farm',
      'url':
          'https://r.search.yahoo.com/_ylt=AwrKBHH3W9Nl1xUbCRi7HAx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3Ny/RV=2/RE=1708379256/RO=10/RU=https%3a%2f%2fwww.bayer.com%2fen%2fagriculture/RK=2/RS=_5Y_N594c6tZQej6MJbPOWSCfPk-'
    },
    {
      'title': 'Bulid your carrer in farming | In-Farm',
      'url':
          'https://r.search.yahoo.com/_ylt=AwrKBHH3W9Nl1xUbChi7HAx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3Ny/RV=2/RE=1708379256/RO=10/RU=https%3a%2f%2fwww.bayer.com%2fen%2fcareer/RK=2/RS=IQ9YM0C5om4HiBmvuzVIbhW6Hb4-'
    },
    {
      'title': 'Biotechnology in agriculutre | In-Farm',
      'url':
          'https://r.search.yahoo.com/_ylt=Awr1QI7gXNNlZBQb8G67HAx.;_ylu=Y29sbwNzZzMEcG9zAzIEdnRpZAMEc2VjA3Ny/RV=2/RE=1708379488/RO=10/RU=https%3a%2f%2fwww.vedantu.com%2fbiology%2fbiotechnology-in-agriculture/RK=2/RS=Jkwy6Phf0ZRmGHh9Kd_jYFoVCJA-'
    },
    {
      'title': 'How middleman exploit farmer in APMC market | In-Farm ',
      'url':
          'https://r.search.yahoo.com/_ylt=Awrx_NVuXdNl2f0aT0y7HAx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3Ny/RV=2/RE=1708379631/RO=10/RU=https%3a%2f%2fgulfnews.com%2fworld%2fasia%2findia%2fhow-middlemen-exploit-farmers-in-india-1.74209558/RK=2/RS=zFB_1sXwOW7L2ijwOt7KzYWoPew-'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/Earthwormlogo.png", width: 15, height: 15),
        title: Text('Earthworm/In-Farm'),
      ),
      body: ListView.builder(
        itemCount: urlInfoList.length,
        itemBuilder: (context, index) {
          final title = urlInfoList[index]['title'];
          final url = urlInfoList[index]['url'];

          Color itemColor = index % 2 == 0 ? Colors.blue : Colors.green;

          return Card(
            color: itemColor,
            child: ListTile(
              title: Text(
                title!,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(url: url!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In-Farm/Earthworm'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}