
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import 'package:universal_html/html.dart' as html;

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final List<String> highlights;
  final String githubUrl;
  final bool isFinalYear;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    required this.highlights,
    required this.githubUrl,
    this.isFinalYear = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // Trigger entry animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _isVisible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return MouseRegion(
      onEnter: isDesktop ? (_) => setState(() => _isHovered = true) : null,
      onExit: isDesktop ? (_) => setState(() => _isHovered = false) : null,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutBack, // 👈 bounce-like effect
        offset: _isVisible
            ? (_isHovered ? const Offset(0, -0.03) : Offset.zero)
            : const Offset(0, 0.08),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 300),
          scale: _isHovered ? 1.03 : 1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: 320,
            height: 420,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: widget.isFinalYear
                    ? AppColors.primary
                    : Colors.white.withOpacity(0.05),
                width: widget.isFinalYear ? 1.6 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(
                    widget.isFinalYear
                        ? 0.35
                        : (_isHovered ? 0.28 : 0.12),
                  ),
                  blurRadius: _isHovered ? 34 : 22,
                  spreadRadius: widget.isFinalYear ? 2 : 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.isFinalYear)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primary.withOpacity(0.15),
                      ),
                      child: const Text(
                        'Final Year Project',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.techStack
                      .map((tech) => _TechChip(tech: tech))
                      .toList(),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.highlights
                      .take(3)
                      .map(
                        (point) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          const Icon(Icons.check, size: 14),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              point,
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      html.window.open(widget.githubUrl, '_blank');
                    },

                    child:  Text('View on GitHub', style: TextStyle(color: Colors.grey.shade300),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String tech;

  const _TechChip({required this.tech});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
        ),
      ),
      child: Text(
        tech,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
