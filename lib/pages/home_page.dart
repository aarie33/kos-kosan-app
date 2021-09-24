import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              // NOTE: Title/Header
              SizedBox(height: edge),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari kosan atau kontrakan yang enaque',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: Popular Cities
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Kota Populer',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/images/city1.png')),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/images/city2.png',
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/images/city3.png')),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: Recommended Spaces
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tempat Rekomendasi',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: FutureBuilder<List<Space>>(
                      future: spaceProvider.getRecommendedSpaces(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Space>? data = snapshot.data;

                          int index = 0;

                          return Column(
                            children: data!.map((item) {
                              index++;
                              return Container(
                                  margin:
                                      EdgeInsets.only(top: index == 1 ? 0 : 30),
                                  child: SpaceCard(item));
                            }).toList(),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })),

              SizedBox(
                height: 30,
              ),
              // NOTE: Tips and Guidances
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips dan Tata Cara',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    TipsCard(Tips(
                        id: 1,
                        title: 'Panduan Antar Kota',
                        imageUrl: 'assets/images/tips1.png',
                        updatedAt: '12 Sept 2021')),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(Tips(
                        id: 2,
                        title: 'Panduan Kos kosan',
                        imageUrl: 'assets/images/tips2.png',
                        updatedAt: '9 Sept 2021')),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_mail.png',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
