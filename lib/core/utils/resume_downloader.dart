// import 'package:universal_html/html.dart' as html;
//
// class ResumeDownloader {
//   static void downloadResume() {
//     final url = 'assets/resume/Hemanath_Resume.pdf';
//
//     final anchor = html.AnchorElement(href: url)
//       ..setAttribute('download', 'Hemanath_Resume.pdf')
//       ..click();
//   }
// }
// /



import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class ResumeViewerPage extends StatelessWidget {
  const ResumeViewerPage({super.key});

  void _downloadResume() {
    final anchor = html.AnchorElement(
      href: 'assets/resume/Hemanath_Resume.pdf',
    )
      ..setAttribute('download', 'Hemanath_Resume.pdf')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _downloadResume,
            tooltip: 'Download Resume',
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Resume opened in new tab.\nUse the download button above.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
