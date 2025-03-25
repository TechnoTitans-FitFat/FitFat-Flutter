import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_cubit.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_state.dart';
import 'package:fitfat/features/settings/presentation/widgets/change_password_widget.dart';
import 'package:fitfat/features/settings/presentation/widgets/custom_dialog.dart';
import 'package:fitfat/features/settings/presentation/widgets/custom_list_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSettingsCubit, AccountSettingsState>(
      builder: (context, state) {
        final cubit = context.read<AccountSettingsCubit>();

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
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.red),
                              onPressed: () {
                                Navigator.pop(context);
                              },
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
                          isExpanded: state.changePasswordExpanded,
                          onExpand: () {
                            cubit.toggleChangePasswordExpanded();
                          },
                          lastPasswordController: cubit.lastPasswordController,
                          newPasswordController: cubit.newPasswordController,
                          confirmPasswordController:
                              cubit.confirmPasswordController,
                          onSave: () {
                            cubit.changePassword();
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomListTileButton(
                          icon: Icons.logout,
                          title: 'Log Out',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  action: "Log Out",
                                  title: "Log Out",
                                  subtitle: "Are you sure you want to log out?",
                                  onPressed: () {
                                    Navigator.of(context).pop();

                                    cubit.logout(
                                        context.read<LoginCubit>().user!.token);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginSignUp(DioComsumer),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomListTileButton(
                          icon: Icons.delete_outline,
                          title: 'Delete Account',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  action: "Delete",
                                  title: "Delete Account",
                                  subtitle:
                                      "Are you sure you want to delete your account?",
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    cubit.deleteAccount(
                                        context.read<LoginCubit>().user!.token);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginSignUp(DioComsumer),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
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
      },
    );
  }
}
