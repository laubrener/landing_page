import 'package:flutter/material.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/shared/custom_app_menu.dart';
import 'package:landing_page/ui/views/about_view.dart';
import 'package:landing_page/ui/views/contact_view.dart';
import 'package:landing_page/ui/views/home_view.dart';
import 'package:landing_page/ui/views/location_view.dart';
import 'package:landing_page/ui/views/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pink,
              Colors.purpleAccent,
            ],
            stops: [0.5, 0.5],
          ),
        ),
        child: const Stack(children: [
          _HomeBody(),
          Positioned(
            right: 20,
            top: 20,
            child: CustomAppMenu(),
          )
        ]),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = context.read<PageProvider>();

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        ContactView(),
        PricingView(),
        LocationView(),
      ],
    );
  }
}
