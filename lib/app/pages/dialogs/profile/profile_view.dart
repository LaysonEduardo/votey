import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/profile/profile_controller.dart';
import 'package:votey/app/routes/app_routes.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/widgets/buttons.dart';
import 'package:votey/app/widgets/custom_dialog.dart';

class ProfileDialog extends GetView<ProfileController> {
  ProfileDialog({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.toNamed(AppRoutes.camera),
          child: CircleAvatar(
            backgroundColor: AppColors.accent,
            radius: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 70,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          'User Name',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: IntrinsicHeight(
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
                        'Votações criadas',
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
              ],
            ),
          ),
        ),
        SimpleMenuButton(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.person,
              color: AppColors.accent,
              size: 30,
            ),
          ),
          body: Text(
            'User Name',
            style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
          ),
          action: IconButton(
            color: AppColors.secondaryLight,
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
        ),
        SimpleMenuButton(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.mail,
              color: AppColors.accent,
              size: 30,
            ),
          ),
          body: Text(
            'user@mail.com',
            style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
          ),
          action: IconButton(
            color: AppColors.secondaryLight,
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
        ),
        SimpleMenuButton(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.key_rounded,
              color: AppColors.accent,
              size: 30,
            ),
          ),
          body: Text(
            'Alterar senha',
            style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
          ),
          action: IconButton(
            color: AppColors.secondaryLight,
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Apagar conta',
                  style: TextStyle(fontSize: 20, color: Colors.red[400], fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
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
