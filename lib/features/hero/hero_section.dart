import 'package:universal_html/html.dart' as html;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/js.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/resume_downloader.dart';
import '../../widgets/profile_photo.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey projectsKey;
  const HeroSection({super.key, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: isDesktop ? _desktopLayout(context) : _mobileLayout(context),
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfilePhoto(size: 140),
        const SizedBox(height: 24),
        _animatedName(),
        const SizedBox(height: 12),
        _animatedRoles(),
        const SizedBox(height: 24),
        _buttons(context),
      ],
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _animatedName(),
              const SizedBox(height: 16),
              _animatedRoles(),
              const SizedBox(height: 32),
              _buttons(context),
            ],
          ),
        ),
        const Expanded(child: Center(child: ProfilePhoto(size: 350))),
      ],
    );
  }

  Widget _animatedName() {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Hi, I’m Hemanath Ponnusamy',
          textStyle: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          speed: const Duration(milliseconds: 80),
        ),
      ],
      totalRepeatCount: 1,
      isRepeatingAnimation: false,
    );
  }

  Widget _animatedRoles() {
    return SizedBox(
      height: 28,
      child: AnimatedTextKit(
        repeatForever: true,
        pause: const Duration(milliseconds: 1200),
        animatedTexts: [
          TypewriterAnimatedText(
            'Flutter Developer',
            speed: const Duration(milliseconds: 70),
            textStyle: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
          TypewriterAnimatedText(
            'Full Stack App Developer',
            speed: const Duration(milliseconds: 70),
            textStyle: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
          TypewriterAnimatedText(
            'Java Backend Developer (Spring Boot)',
            speed: const Duration(milliseconds: 70),
            textStyle: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
          TypewriterAnimatedText(
            'Technology Enthusiast',
            speed: const Duration(milliseconds: 70),
            textStyle: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  // Widget _buttons() {
  //   return Row(
  //     children: [
  //       ElevatedButton(
  //         onPressed: () {},
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: AppColors.primary,
  //           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  //         ),
  //         child: const Text('View Projects', style: TextStyle(color: Colors.white)),
  //       ),
  //       const SizedBox(width: 16),
  //       OutlinedButton(
  //         onPressed: () {
  //           html.window.open(
  //             'assets/resume/Hemanath_Resume.pdf',
  //             '_blank',
  //           );
  //         },
  //         style: OutlinedButton.styleFrom(
  //           foregroundColor: AppColors.primary,
  //           side: const BorderSide(color: AppColors.primary),
  //           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  //         ),
  //         child: const Text('View Resume'),
  //       ),
  //
  //
  //     ],
  //   );
  // }
  Widget _buttons(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            final context = projectsKey.currentContext;
            if (context != null) {
              Scrollable.ensureVisible(
                context,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOutCubic,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
          child: const Text(
            'View Projects',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 16),
        OutlinedButton(
          onPressed: () {
            html.window.open(
              'https://drive.google.com/file/d/1AWP0pqRbTfPLuWVvbkh8WUyGXNjI3is_/view?usp=sharing',
              '_blank',
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
          child: const Text('View Resume'),
        ),
      ],
    );
  }
}
