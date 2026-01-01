// import 'package:flutter/material.dart';
// import '../core/constants/app_colors.dart';
//
// class AppNavbar extends StatelessWidget {
//   final void Function(GlobalKey key) onItemTap;
//   final Map<String, GlobalKey> sectionKeys;
//
//   const AppNavbar({
//     super.key,
//     required this.onItemTap,
//     required this.sectionKeys,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       padding: const EdgeInsets.symmetric(horizontal: 32),
//       decoration: BoxDecoration(
//         color: AppColors.background.withOpacity(0.95),
//         border: Border(
//           bottom: BorderSide(
//             color: Colors.white.withOpacity(0.05),
//           ),
//         ),
//       ),
//       child: Row(
//         children: [
//           const Text(
//             'Hemanath',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           _navItem('Home'),
//           _navItem('About'),
//           _navItem('Skills'),
//           _navItem('Projects'),
//           _navItem('Contact'),
//         ],
//       ),
//     );
//   }
//
//   Widget _navItem(String title) {
//     return TextButton(
//       onPressed: () => onItemTap(sectionKeys[title]!),
//       child: Text(
//         title,
//         style: const TextStyle(
//           color: AppColors.textSecondary,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class AppNavbar extends StatelessWidget {
  final void Function(GlobalKey key) onItemTap;
  final Map<String, GlobalKey> sectionKeys;

  const AppNavbar({
    super.key,
    required this.onItemTap,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.05),
          ),
        ),
      ),
      child: isMobile ? _mobileNavbar(context) : _desktopNavbar(),
    );
  }

  // ===================== DESKTOP =====================
  Widget _desktopNavbar() {
    return Row(
      children: [
        const Text(
          'Hemanath',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        _navItem('Home'),
        _navItem('About'),
        _navItem('Skills'),
        _navItem('Projects'),
        _navItem('Contact'),
      ],
    );
  }

  // ===================== MOBILE =====================
  Widget _mobileNavbar(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Hemanath',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          color: AppColors.background,
          onSelected: (value) {
            final key = sectionKeys[value];
            if (key != null) {
              onItemTap(key);
            }
          },
          itemBuilder: (context) => [
            _popupItem('Home'),
            _popupItem('About'),
            _popupItem('Skills'),
            _popupItem('Projects'),
            _popupItem('Contact'),
          ],
        ),
      ],
    );
  }

  // ===================== NAV ITEM =====================
  Widget _navItem(String title) {
    return TextButton(
      onPressed: () => onItemTap(sectionKeys[title]!),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }

  PopupMenuItem<String> _popupItem(String title) {
    return PopupMenuItem(
      value: title,
      child: Text(
        title,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
    );
  }
}
