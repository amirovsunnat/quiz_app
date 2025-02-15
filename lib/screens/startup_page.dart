import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text_field.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.startupBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 160,
                height: 160,
                margin: EdgeInsets.symmetric(vertical: 120),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "QUIZ\n",
                          style: TextStyle(
                              fontSize: 40,
                              color: AppColors.mainColor,
                              height: 0.4)),
                      TextSpan(
                        text: "          Khelo",
                        style: TextStyle(
                            fontSize: 20, color: AppColors.yellowColor),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            Text(
              "Enter your name",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: "Sunnat Amirov",
            ),
            Spacer(),
            CustomButton(
              buttonText: "Start",
              color: AppColors.yellowColor,
              onPressed: () {
                if (nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter your name"),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(
                        name: nameController.text.trim(),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
