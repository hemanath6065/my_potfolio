import 'package:flutter/material.dart';
import '../../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Some of the projects I’ve worked on, focusing on real-world problems and clean architecture.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 40),
          isDesktop ? _desktopGrid() : _mobileList(),
        ],
      ),
    );
  }

  Widget _desktopGrid() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: const [
        ProjectCard(
          title: 'Quantum-Resistant Encryption System',
          description:
          'Designed a dual-layer encryption system using classical and post-quantum techniques.',
          techStack: ['Java', 'RSA', 'Lattice Crypto', 'Merkle Tree'],
          highlights: [
            'Implemented dual-layer encryption',
            'Integrated Merkle Tree for integrity',
            'Focused on post-quantum security',
          ],
          githubUrl: 'https://github.com/your-github-link',
        ),
        ProjectCard(
          title: 'Dual-Layer Database Encryption',
          description:
          'Built a secure database encryption mechanism for sensitive user data.',
          techStack: ['Java', 'AES', 'RSA', 'MySQL'],
          highlights: [
            'Encrypted data at rest',
            'Hybrid AES + RSA design',
            'Improved data confidentiality',
          ],
          githubUrl: 'https://github.com/your-github-link',
        ),
        ProjectCard(
          title: 'Flutter Portfolio Website',
          description:
          'Responsive portfolio built with Flutter for web and mobile.',
          techStack: ['Flutter', 'Responsive UI'],
          highlights: [
            'Single codebase for web & mobile',
            'Smooth animations & clean UX',
            'Modular architecture',
          ],
          githubUrl: 'https://github.com/your-github-link',
        ),
      ],
    );
  }

  Widget _mobileList() {
    return Column(
      children: const [
        ProjectCard(
          title: 'Quantum-Resistant Encryption System',
          description:
          'Designed a dual-layer encryption system using classical and post-quantum techniques.',
          techStack: ['Java', 'RSA', 'Lattice Crypto', 'Merkle Tree'],
          highlights: [
            'Dual-layer encryption',
            'Merkle Tree integrity',
            'Post-quantum focus',
          ],
          githubUrl: 'https://github.com/your-github-link',
        ),
        SizedBox(height: 20),
        ProjectCard(
          title: 'Dual-Layer Database Encryption',
          description:
          'Built a secure database encryption mechanism for sensitive user data.',
          techStack: ['Java', 'AES', 'RSA', 'MySQL'],
          highlights: [
            'Hybrid AES + RSA',
            'Encrypted data at rest',
            'Secure design',
          ],
          githubUrl: 'https://github.com/your-github-link',
        ),
        SizedBox(height: 20),
        ProjectCard(
          title: 'Flutter Portfolio Website',
          description:
          'Responsive portfolio built with Flutter for web and mobile.',
          techStack: ['Flutter', 'Responsive UI'],
          highlights: [
            'Single codebase',
            'Clean UX',
            'Responsive layout',
          ],
          githubUrl: 'https://github.com/hemanath6065/my_potfolio.git',
        ),
      ],
    );
  }
}
