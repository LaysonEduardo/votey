import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/profile/profile_view.dart';
import 'package:votey/app/pages/settings/settings_controller.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/utils/gradients.dart';
import 'package:votey/app/widgets/buttons.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.secondaryLight,
        elevation: 0,
        title: Text(
          'Configurações',
          style: TextStyle(fontSize: 25, color: AppColors.secondaryLight),
        ),
        centerTitle: true,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: AppGradients.linearDark,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    MenuButton(
                      leading: Hero(
                        tag: 'avatar',
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            backgroundColor: AppColors.accent,
                            radius: 30,
                            child: const Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      body: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'User Name',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(fontSize: 25, color: AppColors.accent, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'No app desde 2020',
                            style: TextStyle(fontSize: 20, color: AppColors.secondaryLight),
                          ),
                        ],
                      ),
                      action: Container(),
                    ),
                    SimpleMenuButton(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.account_circle,
                          color: AppColors.accent,
                          size: 30,
                        ),
                      ),
                      body: Text(
                        'Minha conta',
                        style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
                      ),
                      action: IconButton(
                        color: AppColors.secondaryLight,
                        onPressed: profileDialog,
                        icon: const Icon(Icons.chevron_right_rounded),
                      ),
                      onPressed: profileDialog,
                    ),
                    SimpleMenuButton(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.history,
                          color: AppColors.accent,
                          size: 30,
                        ),
                      ),
                      body: Text(
                        'Histórico',
                        style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
                      ),
                      action: IconButton(
                        color: AppColors.secondaryLight,
                        onPressed: controller.logout,
                        icon: const Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                    SimpleMenuButton(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.notifications_rounded,
                          color: AppColors.accent,
                          size: 30,
                        ),
                      ),
                      body: Text(
                        'Notificações',
                        style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
                      ),
                      action: IconButton(
                        color: AppColors.secondaryLight,
                        onPressed: controller.logout,
                        icon: const Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                    SimpleMenuButton(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.question_answer_rounded,
                          color: AppColors.accent,
                          size: 30,
                        ),
                      ),
                      body: Text(
                        'Convidar',
                        style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
                      ),
                      action: IconButton(
                        color: AppColors.secondaryLight,
                        onPressed: controller.logout,
                        icon: const Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                    SimpleMenuButton(
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.help_outline_rounded,
                          color: AppColors.accent,
                          size: 30,
                        ),
                      ),
                      body: Text(
                        'Preciso de ajuda',
                        style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
                      ),
                      action: IconButton(
                        color: AppColors.secondaryLight,
                        onPressed: controller.logout,
                        icon: const Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              SimpleMenuButton(
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.logout_rounded,
                    color: AppColors.accent,
                    size: 30,
                  ),
                ),
                body: Text(
                  'Sair',
                  style: TextStyle(fontSize: 20, color: AppColors.secondaryLight, fontWeight: FontWeight.bold),
                ),
                action: IconButton(
                  color: AppColors.secondaryLight,
                  onPressed: controller.logout,
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
                onPressed: controller.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
