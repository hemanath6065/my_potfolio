//skill_card.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/icons.dart';

class SkillCard extends StatefulWidget {
  final String title;
  final List<String> skills;
  final IconData icon;
  final String proficiency;

  const SkillCard({
    super.key,
    required this.title,
    required this.skills,
    required this.icon,
    required this.proficiency,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return MouseRegion(
      onEnter: isDesktop ? (_) => setState(() => _isHovered = true) : null,
      onExit: isDesktop ? (_) => setState(() => _isHovered = false) : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        transitionBuilder: (child, animation) {
          final rotate = Tween(begin: 3.14, end: 0.0).animate(animation);
          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(rotate.value),
                child: child,
              );
            },
          );
        },
        child: _isHovered ? _backSide() : _frontSide(),
      ),
    );
  }

  Widget _frontSide() {
    return _cardContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use FaIcon for the main category icon as well
          FaIcon(widget.icon, size: 30, color: AppColors.primary),
          const SizedBox(height: 12),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: widget.skills
                .map((skill) => _SkillChip(skill: skill))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _backSide() {
    return _cardContainer(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(widget.icon, size: 30, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(
            widget.proficiency,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardContainer(Widget child) {
    return Container(
      key: ValueKey(_isHovered),
      width: 280,
      height: 240, // FIXED HEIGHT: Makes all containers the same size
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(_isHovered ? 0.25 : 0.1),
            blurRadius: _isHovered ? 30 : 15,
            spreadRadius: _isHovered ? 3 : 1,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String skill;
  const _SkillChip({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Using FaIcon specifically for FontAwesome icons
          FaIcon(
            getSkillIcon(skill),
            size: 14,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          Text(
            skill,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}