import 'package:flutter/material.dart';
import 'package:rental/core/models/onboarding_model.dart';
import 'package:rental/presentation/screens/onboardingScreen/widgets/bottom_slider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _totalSlides = 3;
  int _currentIndex = 0;
  final List<OnboardingModel> _onboardingLayouts = [];
  final PageController _pageController = PageController();
  @override
  void initState() {
    _onboardingLayouts.addAll(_getOnboardingLayouts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          new TextButton(
              onPressed: () {
                debugPrint("Onboarding skipped..");
              },
              child: const Text("Skip", style: TextStyle(color: Colors.black)))
        ],
      ),
      body: new SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _totalSlides,
          onPageChanged: (value) {
            setState(() => _currentIndex = value);
          },
          itemBuilder: (context, index) {
            return new OnboardingLayout(
                onboardingModel: _onboardingLayouts[index]);
          },
        ),
      ),
      bottomNavigationBar: new BottomSlider(
        index: _currentIndex,
        totalIndex: _totalSlides,
        onComplete: () {
          debugPrint("Onboarding completed..");
        },
        onNext: () => _pageController.animateToPage(_currentIndex + 1,
            duration: const Duration(milliseconds: 800), curve: Curves.ease),
        onPrev: () => _pageController.animateToPage(_currentIndex - 1,
            duration: const Duration(milliseconds: 800), curve: Curves.ease),
      ),
    );
  }

  _getOnboardingLayouts() {
    final List<OnboardingModel> list = [];
    list.add(new OnboardingModel(
        title: "Set destination",
        description: "Choose your desired destination",
        image: ""));
    list.add(new OnboardingModel(
        title: "Request a Ride",
        description: "Request a car type matching your lifestyle",
        image: ""));
    list.add(new OnboardingModel(
        title: "Finish Ride",
        description: "Rate your driver and live a tip if you like",
        image: ""));
    return list;
  }
}

class OnboardingLayout extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingLayout({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      new Image.asset("assets/images/onboarding1.jpg"),
      const SizedBox(height: 32),
      new Text(onboardingModel.title,
          style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      new Text(onboardingModel.description,
          style: Theme.of(context).textTheme.bodyMedium),
    ]);
  }
}
