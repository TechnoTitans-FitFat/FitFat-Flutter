import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../views/login_view.dart';

class AnimatedToggle extends StatefulWidget {
  const AnimatedToggle({
    super.key,
  });

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppLightColor.backgroundColor)),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppLightColor.mainColor,
              ),
              labelColor: AppLightColor.whiteColor,
              unselectedLabelColor: AppLightColor.mainColor,
              tabs: const [
                Tab(
                    child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Sign Up"),
                  ),
                )),
                Tab(
                  child: SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Login"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            controller: _tabController,
            children: [
              const SignUp(),
              Login(),
            ],
          ),
        ),
      ],
    );
  }
}
