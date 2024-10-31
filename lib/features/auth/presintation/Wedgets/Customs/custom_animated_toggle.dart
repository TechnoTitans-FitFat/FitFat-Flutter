import 'package:fitfat/features/auth/presintation/Views/login_view.dart';
import 'package:fitfat/features/auth/presintation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 5),
          child: Container(
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black87)

            ),
            child: TabBar(
              indicatorSize:TabBarIndicatorSize.tab,
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.red,
              tabs: [
                Tab(child: Container(width: double.infinity,child: const Align(
                  alignment: Alignment.center,
                  child: Text("Sign Up"),
                ),)),
                Tab(child: Container(width: double.infinity,child: const Align(
                  alignment: Alignment.center,
                  child: Text("Login"),
                ),),),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
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
