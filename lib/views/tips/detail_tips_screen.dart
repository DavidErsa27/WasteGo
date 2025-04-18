import 'package:flutter/material.dart';
import 'package:wastego_1/models/tips.dart';

class DetailTipsScreen extends StatelessWidget {
  const DetailTipsScreen({super.key, required this.tipsItem});

  final Tips tipsItem;

  List<Widget> buildNumberedList(String steps) {
    final lines = steps.trim().split('\n');

    List<Widget> items = [];

    for (var line in lines) {
      final match = RegExp(r'^(\d+)\.\s+(.*)').firstMatch(line);
      if (match != null) {
        final number = match.group(1)!;
        final text = match.group(2)!;

        items.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  child: Text(
                    "$number.",
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        items.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              line,
              style: const TextStyle(
                fontSize: 14,
                height: 1,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.chevron_left, size: 24),
            ),
            const SizedBox(width: 5),
            Text(
              tipsItem.title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  tipsItem.imageAsset,
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  tipsItem.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              ...buildNumberedList(tipsItem.steps),
            ],
          ),
        ),
      ),
    );
  }
}
