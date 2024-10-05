import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 60),
                          text: 'Snap',
                          children: [
                        TextSpan(
                            style: TextStyle(color: Colors.yellow),
                            text: 'Wall')
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Wallpaper App Based On Pexels.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pexels API Wallpaper App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The Pexels API enables programmatic access to the full Pexels content library, including photos, videos. All content is available free of charge, and you are welcome to use Pexels content for anything you'd like, as long as it is within our Guidelines.",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The Pexels API is a RESTful JSON API, and you can interact with it from any language or framework with a HTTP library. Alternately, Pexels maintains some official Client Libraries you can use.",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "If you have any questions, feel free to check out our FAQ or email us at api@pexels.com.",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Shipon Irfan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Flutter App Developer',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'www.linkedin.com/in/shiponirfan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'www.facebook.com/ShiponIrfan',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
