import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/onboarding_model.dart';

class OnBoardPageWidget extends StatelessWidget {
  final OnboardingModel model;
  const OnBoardPageWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              model.image,
            ),
            width: MediaQuery.of(context).size.width - 20,
            height: MediaQuery.of(context).size.height / 3,
          ),
          const SizedBox(
            height: 35.0,
          ),
          Text(
              model.title.toUpperCase(),
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 16)
              )
          ),
          const SizedBox(
            height: 35.0,
          ),
          Text(
              model.desc,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 20,),
              )
          ),
        ],
      ),
    );
  }
}
