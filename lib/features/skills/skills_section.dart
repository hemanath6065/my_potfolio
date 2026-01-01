//skills_section
import 'package:flutter/material.dart';
import '../../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.start,
              children: const [
                SkillCard(
                  title: 'Languages',
                  icon: Icons.code,
                  skills: ['Java', 'Dart', 'SQL'],
                  proficiency: 'Strong foundation with hands-on coding and problem solving.',
                ),
                SkillCard(
                  title: 'Problem Solving',
                  icon: Icons.extension,
                  skills: [
                    'Arrays',
                    'Strings',
                    'HashMap',
                    'Stack',
                    'Queue',
                    'Binary Search',
                  ],
                  proficiency:
                  'Strong fundamentals with consistent practice in solving real interview-style problems.',
                ),

                SkillCard(
                  title: 'Frameworks',
                  icon: Icons.widgets,
                  skills: ['Flutter', 'Spring Boot'],
                  proficiency: 'Experience building responsive UI and backend services.',
                ),
                SkillCard(
                  title: 'State Management',
                  icon: Icons.sync,
                  skills: ['Provider','Riverpod'],
                  proficiency:
                  'Experience with Provider, StateNotifier, AsyncValue, and clean state separation.',
                ),

                SkillCard(
                  title: 'Backend & DB',
                  icon: Icons.storage,
                  skills: ['REST APIs', 'Firebase', 'MySQL'],
                  proficiency: 'Comfortable designing APIs and working with databases.',
                ),
                SkillCard(
                  title: 'Software Architecture',
                  icon: Icons.account_tree,
                  skills: ['MVVM', 'MVC','CLEAN'],
                  proficiency:
                  'Applied clean architectural patterns to improve maintainability and scalability.',
                ),

                SkillCard(
                  title: 'Tools',
                  icon: Icons.build,
                  skills: ['Git', 'GitHub', 'Android Studio', 'VS Code'],
                  proficiency: 'Daily usage for development, debugging, and version control.',
                ),
                SkillCard(
                  title: 'Security',
                  icon: Icons.security,
                  skills: ['Network Security', 'Cryptography'],

                  proficiency: 'Hands-on experience with encryption and secure system design.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
