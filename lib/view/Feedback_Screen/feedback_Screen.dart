import 'package:flutter/material.dart';
import 'package:sleep_soundscape/view/Feedback_Screen/widget/feedback_bottomsheet.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                feedbackshowbottomSheet(context: context);
              },
              child: Center(child: Text('tap tap')),
            ),
          ],
        ),
      ),
    );
  }
}
