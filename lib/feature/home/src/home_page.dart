import 'package:cached_network_image/cached_network_image.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://ratedrnb.com/cdn/2020/06/UMI.v1.png'),
                radius: 25,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: const Icon(
                          EneftyIcons.notification_bing_outline,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: IconButton(
                        icon: const Icon(
                          EneftyIcons.setting_2_outline,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const Text('categories'),
        Expanded(
          child: StackedCardCarousel(
            initialOffset: 150,
            spaceBetweenItems: 70,
            items: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(10))),
                    height: 30,
                    width: 90,
                  ),
                  Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: 150,
                    child: const Text('item 1'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 90,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(10))),
                  ),
                  Container(
                    color: Colors.redAccent,
                    width: double.infinity,
                    height: 150,
                    child: const Text('item 1'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 90,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(10))),
                  ),
                  Container(
                    color: Colors.blueAccent,
                    width: double.infinity,
                    height: 150,
                    child: const Text('item 1'),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
