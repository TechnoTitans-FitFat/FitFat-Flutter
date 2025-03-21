import 'package:fitfat/features/settings/presentation/widgets/change_password_widget.dart';
import 'package:fitfat/features/settings/presentation/widgets/custom_list_tile_button.dart';
import 'package:flutter/material.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({super.key});

  @override
  State<AccountSettingsView> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsView> {
  bool _changePasswordExpanded = false;
  final _lastPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _lastPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFEE2E2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.red),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Account Settings',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ChangePasswordWidget(
                      isExpanded: _changePasswordExpanded,
                      onExpand: () {
                        setState(() {
                          _changePasswordExpanded = !_changePasswordExpanded;
                        });
                      },
                      lastPasswordController: _lastPasswordController,
                      newPasswordController: _newPasswordController,
                      confirmPasswordController: _confirmPasswordController,
                      onSave: () {
                        print('Password changed');
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomListTileButton(
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomListTileButton(
                      icon: Icons.delete_outline,
                      title: 'Delete Account',
                      onTap: () {},
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
