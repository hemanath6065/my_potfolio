



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
          'Final year project focused on post-quantum secure data protection.',
          techStack: ['Java', 'RSA', 'Lattice Crypto', 'Merkle Tree'],
          highlights: [
            'Dual-layer encryption architecture',
            'Merkle Tree based integrity verification',
            'Post-quantum security research',
          ],
          githubUrl:
          'https://github.com/hemanath6065/Quantum-Resistant-Encryption-System.git',
          isFinalYear: true,
        ),
        ProjectCard(
          title: 'Dual-Layer Database Encryption',
          description:
          'Secure database encryption mechanism for sensitive user data.',
          techStack: ['Java', 'AES', 'RSA', 'MySQL'],
          highlights: [
            'Hybrid AES + RSA approach',
            'Encrypted data at rest',
            'Improved confidentiality',
          ],
          githubUrl:
          'https://github.com/hemanath6065/dual_layer_encryption_by_AES_and_RSA.git',
        ),
        ProjectCard(
          title: 'Flutter Portfolio Website',
          description:
          'Responsive portfolio built using Flutter for web and mobile.',
          techStack: ['Flutter', 'Responsive UI'],
          highlights: [
            'Single codebase',
            'Clean animations',
            'Modular architecture',
          ],
          githubUrl: 'https://github.com/hemanath6065/my_potfolio.git',
        ),
        ProjectCard(
          title: 'Practice Projects',
          description:
          'Collection of hands-on mini projects to strengthen fundamentals.',
          techStack: ['Flutter', 'REST API', 'UI Design'],
          highlights: [
            'Weather Application',
            'Shopping App',
            'YouTube Clone UI',
          ],
          githubUrl: 'https://github.com/hemanath6065',
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
          'Final year project focused on post-quantum secure data protection.',
          techStack: ['Java', 'RSA', 'Lattice Crypto', 'Merkle Tree'],
          highlights: [
            'Dual-layer encryption',
            'Merkle Tree integrity',
            'Post-quantum research',
          ],
          githubUrl:
          'https://github.com/hemanath6065/Quantum-Resistant-Encryption-System.git',
          isFinalYear: true,
        ),
        SizedBox(height: 20),
        ProjectCard(
          title: 'Dual-Layer Database Encryption',
          description:
          'Secure database encryption mechanism for sensitive data.',
          techStack: ['Java', 'AES', 'RSA', 'MySQL'],
          highlights: [
            'Hybrid encryption',
            'Encrypted storage',
            'Secure design',
          ],
          githubUrl:
          'https://github.com/hemanath6065/dual_layer_encryption_by_AES_and_RSA.git',
        ),
        SizedBox(height: 20),
        ProjectCard(
          title: 'Flutter Portfolio Website',
          description:
          'Responsive portfolio built using Flutter.',
          techStack: ['Flutter', 'Responsive UI'],
          highlights: [
            'Clean UI',
            'Responsive layout',
            'Single codebase',
          ],
          githubUrl: 'https://github.com/hemanath6065/my_potfolio.git',
        ),
        SizedBox(height: 20),
        ProjectCard(
          title: 'Practice Projects',
          description:
          'Hands-on mini projects for skill enhancement.',
          techStack: ['Flutter', 'REST API'],
          highlights: [
            'Weather App',
            'Shopping App',
            'YouTube Clone',
          ],
          githubUrl: 'https://github.com/hemanath6065',
        ),
      ],
    );
  }
}
