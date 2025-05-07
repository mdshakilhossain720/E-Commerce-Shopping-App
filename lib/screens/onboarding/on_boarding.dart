import 'package:ecommerceshoppingapp/screens/Auth/login_screen.dart';
import 'package:ecommerceshoppingapp/screens/dashBoard/dashboard.dart';
import 'package:ecommerceshoppingapp/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../widgets/gradient_button.dart' show GradientButton;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;
  final List<OnboardingData> onboardingData = [
    OnboardingData(
      title: 'Discover the best products',
      description: 'Expoloer the best products',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingData(
      title: 'Discover the best products',
      description: 'Expoloer the best products',
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingData(
      title: 'Discover the best products',
      description: 'Expoloer the best products',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(data: onboardingData[index]);
            },
          ),
          Positioned(
            top: 48,
            right: 24,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: currentIndex == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(
                          currentIndex == index ? 1 : 0.3,
                        ),
                      ),
                      duration: Duration(milliseconds: 300),
                    );
                  }),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    if (currentIndex < onboardingData.length - 1)
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    if (currentIndex > 0) SizedBox(width: 16),
                    Expanded(
                      child: GradientButton(
                        title:
                            currentIndex == onboardingData.length - 1
                                ? "Get Started"
                                : "Next",
                        colors: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withOpacity(0.8),
                        ],
                        onButtonPressed: () {
                          if (currentIndex == onboardingData.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          }
                        },
                        //gradientColors: AppTheme.primaryGradient,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnBoardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnBoardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(height: 48),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            data.description,
            style: TextStyle(
              color: AppTheme.textSecondary,

              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
