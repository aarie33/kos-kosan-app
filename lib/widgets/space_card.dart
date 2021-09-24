import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/detail_page.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  space.imageUrl != null
                      ? Image.network(space.imageUrl!,
                          width: 130, height: 110, fit: BoxFit.cover)
                      : Image.asset(
                          space.imageUrl ?? 'assets/images/space1.png'),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text('${space.rating}/5',
                              style: whiteTextStyle.copyWith(fontSize: 13)),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name ?? 'Space',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: ' / month',
                        style: greyTextStyle.copyWith(fontSize: 16))
                  ])),
              SizedBox(
                height: 16,
              ),
              Text.rich(
                TextSpan(
                    text: '${space.city}',
                    style: greyTextStyle,
                    children: [
                      TextSpan(
                        text: ', ${space.country}',
                        style: greyTextStyle,
                      )
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
