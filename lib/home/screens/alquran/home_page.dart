import 'package:alquran_kareem/data/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/widget/search_button.dart';
import 'package:alquran_kareem/home/controllers/home_controller.dart';
import 'package:alquran_kareem/routes/view-routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Al Quran Kareem'),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.wb_sunny), // Icon matahari
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
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Al Quran Kareem',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: const Text(
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
        body: FutureBuilder<List<Surah>>(
            future: controller.getAllSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak ada data"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Surah surah = snapshot.data![index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(Routes.detail, arguments: surah);
                      },
                      leading: CircleAvatar(
                        child: Text("${surah.number}"),
                      ),
                      title: Text(
                          "${surah.name?.transliteration?.id ?? 'error..'}"),
                      subtitle: Text(
                          "${surah.numberOfVerses} ayat | ${surah.revelation?.id ?? 'error..'}"),
                      trailing: Text("${surah.name?.short ?? 'error..'}"),
                    );
                  });
            }));
  }
}
