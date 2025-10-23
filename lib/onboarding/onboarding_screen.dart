/*import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Personalize Your Experience",
      "subtitle":
          "Choose your preferred theme and language to get started with a comfortable, "
          "tailored experience that suits your style.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Find Events That Inspire You",
      "subtitle":
          "Dive into a world of events crafted to fit your unique interests. "
          "Whether you're into live music, art workshops, professional networking, "
          "or simply discovering new experiences, we have something for everyone. "
          "Our curated recommendations will help you explore, connect, "
          "and make the most of every opportunity around you.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Effortless Event Planning",
      "subtitle":
          "Take the hassle out of organizing events with our all-in-one planning tools. "
          "From setting up invites and managing RSVPs to scheduling reminders and coordinating details, "
          "we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      "image": "assets/images/onboarding3.png",
    },
    {
      "title": "Connect with Friends",
      "subtitle":
          "Make every event memorable by sharing the experience with others. "
          "Our platform lets you invite friends, keep everyone in the loop, "
          "and celebrate moments together. Capture and share the excitement with your network, "
          "so you can relive the highlights and cherish the memories.",
      "image": "assets/images/onboarding4.png",
    },
  ];

  void _goToNextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ================= Logo ثابت فوق =================
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/splachLogo.png", // اللوجو
                height: 80,
              ),
            ),

            // ================= الصفحات =================
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardContent(
                  title: onboardingData[index]["title"]!,
                  subtitle: onboardingData[index]["subtitle"]!,
                  image: onboardingData[index]["image"]!,
                ),
              ),
            ),

            // ================= الأسهم + المؤشرات =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage > 0
                      ? IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 28,
                            color: Colors.blue,
                          ),
                          onPressed: _goToPreviousPage,
                        )
                      : SizedBox(width: 48), // مكان فاضي للتوازن
                  // Dots
                  Row(
                    children: List.generate(
                      onboardingData.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.blue
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  _currentPage == onboardingData.length - 1
                      ? TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.loginRouteName,
                            );
                          },
                          child: Text(
                            "Let's Start",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 28,
                            color: Colors.blue,
                          ),
                          onPressed: _goToNextPage,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String title, subtitle, image;

  const OnboardContent({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الصورة تكبر بشكل مرن حسب المساحة
        Expanded(flex: 2, child: Image.asset(image, fit: BoxFit.contain)),
        SizedBox(height: 20),

        // النصوص
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(title, style: AppStyles.medium20primary),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

 */

import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  bool _isDarkTheme = false;
  bool _isEnglish = true;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Personalize Your Experience",
      "subtitle":
      "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Find Events That Inspire You",
      "subtitle":
      "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Effortless Event Planning",
      "subtitle":
      "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      "image": "assets/images/onboarding3.png",
    },
    {
      "title": "Connect with Friends",
      "subtitle":
      "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
      "image": "assets/images/onboarding4.png",
    },
  ];

  void _goToNextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ======== Logo at the top ========
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/splachLogo.png",
                height: 80,
              ),
            ),

            // ======== Onboarding Pages ========
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) =>
                    OnboardContent(
                      title: onboardingData[index]["title"]!,
                      subtitle: onboardingData[index]["subtitle"]!,
                      image: onboardingData[index]["image"]!,
                      isDark: _isDarkTheme,
                      isEnglish: _isEnglish,
                      toggleTheme: _toggleTheme,
                      toggleLanguage: _toggleLanguage,
                    ),
              ),
            ),

            // ======== Bottom Controls ========
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage > 0
                      ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                      color: _isDarkTheme ? Colors.white : Colors.blue,
                    ),
                    onPressed: _goToPreviousPage,
                  )
                      : SizedBox(width: 48),
                  // Dots
                  Row(
                    children: List.generate(
                      onboardingData.length,
                          (index) =>
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? (_isDarkTheme ? Colors.white : Colors.blue)
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                    ),
                  ),
                  _currentPage == onboardingData.length - 1
                      ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.loginRouteName,
                      );
                    },
                    child: Text(
                      "Let's Start",
                      style: TextStyle(
                        fontSize: 16,
                        color: _isDarkTheme ? Colors.white : Colors.blue,
                      ),
                    ),
                  )
                      : IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 28,
                      color: _isDarkTheme ? Colors.white : Colors.blue,
                    ),
                    onPressed: _goToNextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String title, subtitle, image;
  final bool isDark, isEnglish;
  final VoidCallback toggleTheme, toggleLanguage;

  const OnboardContent({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isDark,
    required this.isEnglish,
    required this.toggleTheme,
    required this.toggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: Image.asset(image, fit: BoxFit.contain)),
        SizedBox(height: 20),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  title,
                  style: AppStyles.medium20primary.copyWith(
                    color: isDark ? Colors.white : Colors.blue,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // ======== Language + Theme Icons (bottom right) ========
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Language
                        InkWell(
                          onTap: toggleLanguage,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: isDark ? Colors.white : Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.language,
                              size: 22,
                              color: isDark ? Colors.white : Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        // Theme
                        InkWell(
                          onTap: toggleTheme,
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: isDark ? Colors.white : Colors.blue),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              isDark ? Icons.dark_mode : Icons.light_mode,
                              size: 22,
                              color: isDark ? Colors.white : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
