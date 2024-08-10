import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  final String url;
  final String header;
  const LinkText({super.key, required this.url, required this.header});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: _launchURL,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$header: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width:5),
            Expanded(
              child: Text(
                url.substring(0, 6) == 'mailto' ? url.substring(7) : url,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
                maxLines: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
