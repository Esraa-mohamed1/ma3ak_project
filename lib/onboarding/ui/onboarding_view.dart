import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma3ak_app/routes/routes.dart';
import 'package:ma3ak_app/utils/constants/colors.dart';
import 'package:ma3ak_app/onboarding/ui/onboarding_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final PageController pageController = PageController();
  bool isLastPage = false;
  int currentScreen = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(top: 15, left: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$currentScreen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                TextSpan(
                  text: '/3',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffA0A0A1),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => pageController.jumpToPage(controller.items.length - 1),
            child: Text('اجتاز'),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        child: PageView.builder(
          onPageChanged: (index) => setState(() {
            isLastPage = controller.items.length - 1 == index;
            currentScreen = index + 1;
          }),
          controller: pageController,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.items[index].image,
                    height: 300,
                    width: 300,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      controller.items[index].description,
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentScreen != 1
                ? TextButton(
              onPressed: () => pageController.jumpToPage(currentScreen - 2),
              child: Text('ارجع'),
            )
                : SizedBox(width: 40),
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) =>
                  pageController.animateToPage(index, duration: Duration(milliseconds: 600), curve: Curves.easeIn),
              effect: ExpandingDotsEffect(
                dotColor: Color(0xFF17223B),
                dotHeight: 8,
                dotWidth: 15,
              ),
            ),
            isLastPage == false
                ? TextButton(
              onPressed: () => pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeIn),
              child: Text('التالي'),
            )
                : TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('onboarding', true);
                if (!mounted) return;
                Navigator.pushReplacementNamed(context, RoutesName.login);
              },
              child: Text('ابدأ'),
            ),
          ],
        ),
      ),
    );
  }
}
