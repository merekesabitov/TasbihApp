import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/top_panel_provider.dart';
import '../../../services/colors.dart';
import '../../auth/account_screen.dart';
import '../../auth/login_screen.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final topPanelProvider = context.watch<TopPanelProvider>();
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if ((user == null)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 38,
              width: 54,
              margin: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.person_2,
                color: (user == null) ? Colors.grey : myBlue,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 38,
              width: 276,
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => topPanelProvider.toogle(false),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: topPanelProvider.isActivity
                              ? myBlue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Activity'.tr(),
                          style: TextStyle(
                            color: topPanelProvider.isActivity
                                ? Colors.white
                                : Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => topPanelProvider.toogle(true),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: topPanelProvider.isActivity
                              ? Colors.white
                              : myBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Saved'.tr(),
                          style: TextStyle(
                            color: topPanelProvider.isActivity
                                ? Colors.black
                                : Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go('/settings');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 38,
              width: 54,
              margin: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/img/menu.png'),
            ),
          )
        ],
      ),
    );
  }
}
