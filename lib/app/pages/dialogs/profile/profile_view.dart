import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/profile/profile_controller.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/widgets/custom_dialog.dart';

class ProfileDialog extends GetView<ProfileController> {
  ProfileDialog({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.accent,
          radius: 50,
          child: const Icon(
            Icons.person,
            size: 70,
          ),
        ),
        Text(
          'UserName',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Respostas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryLight,
                      ),
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(color: AppColors.secondaryLight),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Votações',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryLight,
                      ),
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     Text(
              //       'Votações respostas',
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //         color: AppColors.secondaryLight,
              //       ),
              //     ),
              //     Text(
              //       '20',
              //       style: TextStyle(
              //         fontSize: 15,
              //         fontWeight: FontWeight.bold,
              //         color: AppColors.secondaryLight,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        )
      ],
    );
  }
}

profileDialog() {
  customDialog(
    Get.context!,
    Icons.account_circle,
    'Minha conta',
    GestureDetector(child: ProfileDialog()),
  );
}
