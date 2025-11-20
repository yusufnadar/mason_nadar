import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../data/model/onboarding_model.dart';
import '../view/onboarding_view.dart';

mixin OnboardingMixin on State<OnboardingView> {

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  final onboardings = <OnboardingModel>[
    OnboardingModel(
      title: 'Discover Your Inner\nExplorer',
      subtitle: 'AI transforms your photo into a traveler. Let the journey begin with just one snap.',
      image: '',
    ),
    OnboardingModel(
      title: 'Step Into the Wild',
      subtitle: 'Your photo becomes a safari adventurer with the power of AI. Unleash your wild side in seconds.',
      image: '',
    ),
    OnboardingModel(
      title: 'Style Your Perfect Look',
      subtitle: 'AI creates a photo of you and your ideal partner — complete with your signature headwear.',
      image: '',
    ),
    OnboardingModel(
      image: '', //Assets.images.reviewUs.path,
      title: 'Please review our app',
      subtitle: 'Your feedback will help us get better for your future convenience',
    ),
  ];
}
