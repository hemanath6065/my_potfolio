
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/highlight_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: isDesktop ? _desktopLayout() : _mobileLayout(),
    );
  }

  // ================= MOBILE =================
  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(),
        const SizedBox(height: 24),
        _aboutText(),
        const SizedBox(height: 32),
        _highlights(),
      ],
    );
  }

  // ================= DESKTOP =================
  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle(),
              const SizedBox(height: 24),
              _aboutText(),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 3,
          child: _highlights(),
        ),
      ],
    );
  }

  // ================= UI PARTS =================

  Widget _sectionTitle() {
    return const Text(
      'About Me',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _aboutText() {
    return Text(
      'I am a Mobile App Developer currently working at a startup, where I build '
          'production-ready Flutter applications for real-world use cases. I focus on '
          'creating responsive, scalable, and maintainable mobile and web experiences.\n\n'
          'I have a strong background in Flutter development, Java-based backend systems, '
          'and secure application design. My experience includes working with REST APIs, '
          'authentication, Firebase, and encryption-based projects, which helps me build '
          'applications with both performance and security in mind.\n\n'
          'I enjoy learning how complete software systems work end-to-end and continuously '
          'improving my skills through hands-on development.',
      style: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _highlights() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: const [
        HighlightCard(
          title: 'Flutter & Mobile',
          description: 'Building production-ready, responsive apps and websites using Flutter.',
        ),
        HighlightCard(
          title: 'Startup Experience',
          description: 'Hands-on experience working in fast-paced startup environments.',
        ),
        HighlightCard(
          title: 'Security & Backend',
          description: 'Experience with Java backend systems and secure data handling.',
        ),
      ],
    );
  }
}
