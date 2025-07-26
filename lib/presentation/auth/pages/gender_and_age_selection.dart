import 'package:flutter/material.dart';
import 'package:practice_ecommerce/common/widets/appbar/app_bar.dart';
import 'package:practice_ecommerce/common/widets/button/basic_app_button.dart';
import 'package:practice_ecommerce/core/configs/theme/app_colors.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tellUs(),
                const SizedBox(height: 30),
                _genders(context),
                const SizedBox(height: 30),
                howOld(),
                const SizedBox(height: 30),
                _age(),
              ],
            ),
          ),
          const Spacer(),
          _finishButton(context),
        ],
      ),
    );
  }

  Widget _tellUs() {
    return const Text(
      'Tell us about yourself',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        genderTile(context, 1, 'Men'),
        const SizedBox(width: 20),
        genderTile(context, 2, 'Women'),
      ],
    );
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget howOld() {
    return const Text(
      'How old are you?',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _age() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("24-30"), const Icon(Icons.keyboard_arrow_down)],
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(
          builder: (context) {
            return BasicAppButton(onPressed: () {}, title: 'Finish');
          },
        ),
      ),
    );
  }
}
