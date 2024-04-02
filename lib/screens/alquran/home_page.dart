import 'package:flutter/material.dart';
import 'package:alquran_kareem/widget/search_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Al Quran Kareem'),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.wb_sunny), // Icon matahari
            onPressed: () {
              // Aksi ketika ikon matahari ditekan
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: [Container(), const SearchTextField()],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Al Quran Kareem',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'Al Quran',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Action when item 1 is tapped
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text(
                'Hadist',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Action when item 2 is tapped
                Navigator.pushNamed(context, '/hadist');
              },
            ),
            // Add more items if needed
          ],
        ),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
