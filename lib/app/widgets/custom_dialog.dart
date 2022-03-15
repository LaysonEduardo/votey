import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/utils/colors.dart';

customDialog(
  BuildContext context,
  IconData icon,
  String title,
  Widget child,
) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Dialog(
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.all(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withOpacity(0.9),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SafeArea(
                  top: false,
                  bottom: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                icon,
                                size: 35,
                                color: AppColors.accent,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  title,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        child,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: IconButton(
                    iconSize: 35,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close, color: Colors.red[500]),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
    // builder: (builder) {

    // },
  );
}
