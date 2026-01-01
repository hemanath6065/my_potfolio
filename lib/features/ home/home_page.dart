import 'package:flutter/material.dart';
import '../../widgets/app_navbar.dart';
import '../hero/hero_section.dart';
import '../about/about_section.dart';
import '../skills/skills_section.dart';
import '../projects/projects_section.dart';
import '../contact/contact_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sectionKeys = {
      'Home': _homeKey,
      'About': _aboutKey,
      'Skills': _skillsKey,
      'Projects': _projectsKey,
      'Contact': _contactKey,
    };

    return Scaffold(
      body: Column(
        children: [
          AppNavbar(
            onItemTap: _scrollTo,
            sectionKeys: sectionKeys,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(key: _homeKey, child: const HeroSection()),
                  Container(key: _aboutKey, child: const AboutSection()),
                  Container(key: _skillsKey, child: const SkillsSection()),
                  Container(key: _projectsKey, child: const ProjectsSection()),
                  Container(key: _contactKey, child: const ContactSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
