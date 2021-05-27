import 'package:flutter/material.dart';
import '../../widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Schedule Your \nJourney.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            UserForm(),
          ],
        ),
      ),
    );
  }
}
