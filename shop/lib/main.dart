import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/login.jpeg', // Replace with your image path
              height: 500,
               width: MediaQuery.of(context).size.width,
              // width:800,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchCompanyPage()),
                );
               
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
// class SearchCompanyPage extends StatefulWidget {
//   @override
//   _SearchCompanyPageState createState() => _SearchCompanyPageState();
// }

// class _SearchCompanyPageState extends State<SearchCompanyPage> {
//   List<String> companyList = [
//     'Infosys',
//     'TechVercent',
//     'Auro',
//     'Softzane solutions',
//     // Add more company names as needed
//   ];

//   List<String> displayedCompanies = [];

//   @override
//   void initState() {
//     displayedCompanies.addAll(companyList);
//     super.initState();
//   }

//   void _filterCompanies(String query) {
//     setState(() {
//       displayedCompanies = companyList
//           .where((company) =>
//               company.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Company'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               onChanged: _filterCompanies,
//               decoration: InputDecoration(
//                 labelText: 'Search Company',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 itemCount: displayedCompanies.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Center(
//                       child: Text(displayedCompanies[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Company {
  String name;
  String imageUrl;

  Company({required this.name, required this.imageUrl});
}

class SearchCompanyPage extends StatefulWidget {
  @override
  _SearchCompanyPageState createState() => _SearchCompanyPageState();
}

class _SearchCompanyPageState extends State<SearchCompanyPage> {
  List<Company> companyList = [
    Company(name: 'Infosys', imageUrl: 'assets/verse.jpeg'),
    Company(name: 'TechVercent', imageUrl: 'assets/mountain.jpeg'),
     Company(name: 'Headphone', imageUrl: 'assets/headphone.jpeg'),
      Company(name: 'cycle', imageUrl: 'assets/cycle.jpeg'),
    // Add more companies with their image URLs as needed
  ];

  List<Company> displayedCompanies = [];

  @override
  void initState() {
    displayedCompanies.addAll(companyList);
    super.initState();
  }

  void _filterCompanies(String query) {
    setState(() {
      displayedCompanies = companyList
          .where((company) =>
              company.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Company'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: _filterCompanies,
              decoration: InputDecoration(
                labelText: 'Search Company',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: displayedCompanies.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          displayedCompanies[index].imageUrl,
                          height: 100,
                          width: 100,
                          // You can adjust height and width as needed
                        ),
                        SizedBox(height: 10),
                        Text(displayedCompanies[index].name),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

