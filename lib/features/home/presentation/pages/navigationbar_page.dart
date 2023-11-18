import 'package:flutter/material.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/features/administration/presentation/pages/administration_page.dart';
import 'package:test_app/features/categori/presentation/pages/categori_page.dart';
import 'package:test_app/features/home/presentation/pages/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  Widget currentScreen = const ProductScreen();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        height: 70,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          color:white,
        ),
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 46,
              width: 80,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentScreen = const ProductScreen();
                    currentTab = 0;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.home,color:currentTab == 0 ?green:black),
                    const SizedBox(
                      height:3,
                    ),
                    Text("Home",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: currentTab == 0 ?green:black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 46,
              width: 80,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentScreen = const CategoriesPage();
                    currentTab = 1;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.category,color:currentTab == 1 ?green:black),
                    const SizedBox(
                      height:3,
                    ),
                    Text("Categorie",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: currentTab == 1 ?green:black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 46,
              width: 80,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentScreen = const AdministrationPage();
                    currentTab = 2;
                  });
                },
                child: Column(
                  children: [
                    Icon(Icons.person,color:currentTab == 2 ?green:black),
                    const SizedBox(
                      height:3,
                    ),
                    Text("Administration",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: currentTab == 2 ?green:black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
