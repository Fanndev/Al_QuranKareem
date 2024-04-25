import 'package:alquran_kareem/data/model/juz.dart' as juz;
import 'package:alquran_kareem/data/model/surah.dart';
import 'package:alquran_kareem/theme/fonts.dart';
import 'package:alquran_kareem/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/widget/search_button.dart';
import 'package:alquran_kareem/home/controllers/home_controller.dart';
import 'package:alquran_kareem/routes/view-routes.dart';
import 'package:lottie/lottie.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Al Quran Kareem',
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: appWhite),
        actions: <Widget>[
          IconButton(
            icon: Obx(
              () => controller.isDarkMode.value
                  ? Icon(Icons.brightness_high, color: appWhite)
                  : Icon(Icons.brightness_low, color: appWhite),
            ),
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(themeLight)
                  : Get.changeTheme(themeDark);
              controller.isDarkMode.toggle();
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
                color: appBlue,
              ),
              child: Text(
                'Al Quran Kareem',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: appWhite),
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
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: Get.isDarkMode
                    ? TextStyle(fontSize: 12, fontWeight: semibold)
                    : TextStyle(fontSize: 12, fontWeight: semibold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fulan",
                style: Get.isDarkMode
                    ? TextStyle(fontSize: 20, fontWeight: extrabold)
                    : TextStyle(fontSize: 20, fontWeight: extrabold),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.lastRead),
                  borderRadius: BorderRadius.circular(20),
                  child: Obx(
                    () => Container(
                      height: 150,
                      width: Get.width,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -10,
                            right: 0,
                            child: Container(
                              width: 170,
                              height: 170,
                              child: Image.asset(
                                iconQuran2,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Terakhir dibaca",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 12, fontWeight: medium),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Al Baqarah",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 18, fontWeight: extrabold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Juz 1 | Ayat 3",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 12, fontWeight: medium),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: controller.isDarkMode.isTrue
                              ? [appBluedarkmode, appBluemode]
                              : [appBlue, appBlueLight],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Ayo Baca Quran',
                style: Get.isDarkMode
                    ? TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      )
                    : TextStyle(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Surah",
                      style: Get.isDarkMode
                          ? TextStyle(fontWeight: medium, fontSize: 15)
                          : TextStyle(
                              fontWeight: medium,
                              fontSize: 15,
                            ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Juz",
                      style: Get.isDarkMode
                          ? TextStyle(fontWeight: medium, fontSize: 15)
                          : TextStyle(
                              fontWeight: medium,
                              fontSize: 15,
                            ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Bookmark",
                      style: Get.isDarkMode
                          ? TextStyle(fontWeight: medium, fontSize: 15)
                          : TextStyle(
                              fontWeight: medium,
                              fontSize: 15,
                            ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Tidak ada data"),
                          );
                        }
                        // page 1 Surah
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical:
                                      10), // Atur jarak antara setiap item
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: controller.isDarkMode.isTrue
                                          ? [appBluedarkmode, appBluemode]
                                          : [
                                              appBlue,
                                              appBlueLight,
                                            ], // Atur warna gradient
                                    ),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      Get.toNamed(Routes.detail,
                                          arguments: surah);
                                    },
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            bingkaiputih,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${surah.number}",
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: medium,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "${surah.name?.transliteration?.id ?? 'error..'}",
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 15,
                                      ), // Warna teks putih
                                    ),
                                    subtitle: Text(
                                      "${surah.numberOfVerses} ayat | ${surah.revelation?.id ?? 'error..'}",
                                      style: whiteTextStyle.copyWith(
                                          fontWeight:
                                              medium), // Warna teks putih
                                    ),
                                    trailing: Text(
                                      "${surah.name?.short ?? 'error..'}",
                                      style: whiteTextStyle.copyWith(
                                          fontWeight:
                                              semibold), // Warna teks putih
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    // page 2 Juz
                    FutureBuilder<List<juz.Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            juz.Juz detailJuz = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical:
                                      10), // Atur jarak antara setiap item
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: controller.isDarkMode.isTrue
                                          ? [appBluedarkmode, appBluemode]
                                          : [
                                              appBlue,
                                              appBlueLight,
                                            ], // Atur warur warna gradient
                                    ),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      Get.toNamed(Routes.detailjuz,
                                          arguments: detailJuz);
                                    },
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            bingkaiputih,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: medium,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "Juz ${index + 1}",
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 15,
                                      ), // Warna teks putih
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${detailJuz.juzStartInfo} sampai ${detailJuz.juzEndInfo}",
                                          style: whiteTextStyle.copyWith(
                                            fontWeight: semibold,
                                            fontSize: 10,
                                          ), // Warna teks putih
                                        ),
                                        // Text(
                                        //   "${detailJuz.juzEndInfo}",
                                        //   style: whiteTextStyle.copyWith(
                                        //     fontWeight: semibold,
                                        //     fontSize: 10,
                                        //   ), // Warna teks putih
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    // Page 3 Bookmark
                    Center(child: Text('page 3')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
