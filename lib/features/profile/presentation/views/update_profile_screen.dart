import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/profile/presentation/cubit/diet_info_cubit/update_diet_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/health_info_cubit/update_health_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/views/health_info_section.dart';
import 'package:fitfat/features/profile/presentation/widgets/nutrition_info_section.dart';
import 'general_info_section.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> initialData;
  final String userId;
  final String? userToken;

  const EditProfileScreen({
    Key? key,
    required this.initialData,
    required this.userId,
    this.userToken,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _insulinCarbController = TextEditingController();
  final _correctionFactorController = TextEditingController();
  final _proteinsController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatsController = TextEditingController();
  final _caloriesController = TextEditingController();

  String selectedGender = 'Female';
  String selectedMonth = 'January';
  String selectedDay = '1';
  String selectedYear = '1990';
  String selectedAllergy = 'None';
  String selectedDietType = 'Keto';
  String selectedDietaryGoal = 'Weight Loss';
  String selectedActivityLevel = 'Moderately Active';
  String selectedMealPreference = 'Vegetarian';
  String selectedDiabetesType = 'None';

  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    final data = widget.initialData;

    _heightController.text = data['height']?.toString() ?? '170';
    _weightController.text = data['weight']?.toString() ?? '70';
    _insulinCarbController.text =
        data['insulinToCarbRatio']?.toString() ?? '15';
    _correctionFactorController.text =
        data['correctionFactor']?.toString() ?? '50';
    _proteinsController.text =
        data['macronutrientGoals']?['proteins']?.toString() ?? '100';
    _carbsController.text =
        data['macronutrientGoals']?['carbs']?.toString() ?? '50';
    _fatsController.text =
        data['macronutrientGoals']?['fats']?.toString() ?? '70';
    _caloriesController.text =
        data['macronutrientGoals']?['calories']?.toString() ?? '1500';

    selectedGender = data['gender']?.toString() ?? 'Female';
    selectedMonth = data['dateOfBirth']?['month']?.toString() ?? 'January';
    selectedDay = data['dateOfBirth']?['day']?.toString() ?? '1';
    selectedYear = data['dateOfBirth']?['year']?.toString() ?? '1990';
    selectedAllergy = data['foodAllergies']?.toString() ?? 'None';
    selectedDietType = data['dietType']?.toString() ?? 'Keto';
    selectedDietaryGoal = data['dietaryGoals']?.toString() ?? 'Weight Loss';
    selectedActivityLevel =
        data['activityLevel']?.toString() ?? 'Moderately Active';
    selectedMealPreference =
        data['mealPreferences']?.toString() ?? 'Vegetarian';
    selectedDiabetesType = data['diabetesType']?.toString() ?? 'None';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateDietInfoCubit, UpdateDietInfoState>(
          listener: _onDietInfoUpdate,
        ),
        BlocListener<UpdateHealthInfoCubit, UpdateHealthInfoState>(
          listener: _onHealthInfoUpdate,
        ),
      ],
      child: Scaffold(
        backgroundColor: context.theme.secondColor,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: context.theme.secondColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Edit Profile',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GeneralInfoSection(
            selectedGender: selectedGender,
            selectedMonth: selectedMonth,
            selectedDay: selectedDay,
            selectedYear: selectedYear,
            heightController: _heightController,
            weightController: _weightController,
            onGenderChanged: (value) => setState(() => selectedGender = value),
            onMonthChanged: (value) => setState(() => selectedMonth = value),
            onDayChanged: (value) => setState(() => selectedDay = value),
            onYearChanged: (value) => setState(() => selectedYear = value),
          ),
          const SizedBox(height: 20),
          HealthInfoSection(
            selectedAllergy: selectedAllergy,
            selectedDiabetesType: selectedDiabetesType,
            insulinCarbController: _insulinCarbController,
            correctionFactorController: _correctionFactorController,
            onAllergyChanged: (value) =>
                setState(() => selectedAllergy = value),
            onDiabetesTypeChanged: (value) =>
                setState(() => selectedDiabetesType = value!),
          ),
          const SizedBox(height: 20),
          NutritionInfoSection(
            selectedDietType: selectedDietType,
            selectedDietaryGoal: selectedDietaryGoal,
            selectedActivityLevel: selectedActivityLevel,
            selectedMealPreference: selectedMealPreference,
            proteinsController: _proteinsController,
            carbsController: _carbsController,
            fatsController: _fatsController,
            caloriesController: _caloriesController,
            onDietTypeChanged: (value) =>
                setState(() => selectedDietType = value),
            onDietaryGoalChanged: (value) =>
                setState(() => selectedDietaryGoal = value),
            onActivityLevelChanged: (value) =>
                setState(() => selectedActivityLevel = value),
            onMealPreferenceChanged: (value) =>
                setState(() => selectedMealPreference = value),
          ),
          const SizedBox(height: 30),
          _buildUpdateButton(),
        ],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isUpdating ? null : _updateProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isUpdating ? Colors.grey : Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _isUpdating
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Update Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  void _onDietInfoUpdate(BuildContext context, UpdateDietInfoState state) {
    if (state is UpdateDietInfoLoaded) {
      _showSuccessAndNavigateBack('Diet info updated successfully!');
    } else if (state is UpdateDietInfoError) {
      _showError('Diet Info Error: ${state.message}');
    }
  }

  void _onHealthInfoUpdate(BuildContext context, UpdateHealthInfoState state) {
    if (state is UpdateHealthInfoLoaded) {
      _showSuccessAndNavigateBack('Health info updated successfully!');
    } else if (state is UpdateHealthInfoError) {
      _showError('Health Info Error: ${state.message}');
    }
  }

  void _updateProfile() {
    if (_isUpdating) return;

    setState(() => _isUpdating = true);

    try {
      final dietInfo = _createDietInfo();
      final healthInfo = _createHealthInfo();
      Navigator.pop(context);

      final token =
          BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
      if (token != null) {
        BlocProvider.of<UserProfileCubit>(context).getUserProfile(token: token);
        BlocProvider.of<UserProfileCubit>(context).getUserProfile(token: token);
      }
      context
          .read<UpdateDietInfoCubit>()
          .updateDietInfo(widget.userId, dietInfo);
      context
          .read<UpdateHealthInfoCubit>()
          .updateHealthInfo(widget.userId, healthInfo);
    } catch (e) {
      _showError('Error updating profile: $e');
    }
  }

  DietInfo _createDietInfo() {
    return DietInfo(
      dietType: selectedDietType,
      macronutrientGoals: MacronutrientGoals(
        proteins: int.tryParse(_proteinsController.text) ?? 0,
        carbs: int.tryParse(_carbsController.text) ?? 0,
        fats: int.tryParse(_fatsController.text) ?? 0,
        calories: int.tryParse(_caloriesController.text) ?? 0,
      ),
      dietaryGoals: selectedDietaryGoal,
      activityLevel: selectedActivityLevel,
      mealPreferences: selectedMealPreference,
    );
  }

  HealthInfo _createHealthInfo() {
    return HealthInfo(
      foodAllergies: selectedAllergy,
      diabetes: selectedDiabetesType != 'None',
      weight: int.tryParse(_weightController.text) ?? 0,
      height: int.tryParse(_heightController.text) ?? 0,
      dateOfBirth: DateTime(
        int.tryParse(selectedYear) ?? 1990,
        _monthToInt(selectedMonth),
        int.tryParse(selectedDay) ?? 1,
      ),
      gender: selectedGender,
      targetBloodSugarRange: const BloodSugarRange(min: 70, max: 130),
      diabetesType: selectedDiabetesType,
      insulinToCarbRatio: double.tryParse(_insulinCarbController.text) ?? 0.0,
      correctionFactor:
          double.tryParse(_correctionFactorController.text) ?? 0.0,
    );
  }

  void _showSuccessAndNavigateBack(String message) {
    setState(() => _isUpdating = false);

    _showSnackBar(message, Colors.green);

    if (widget.userToken != null) {
      context.read<UserProfileCubit>().getUserProfile(
            token: widget.userToken!,
            userId: widget.userId,
          );
    }
  }

  void _showError(String message) {
    setState(() => _isUpdating = false);
    _showSnackBar(message, Colors.red);
  }

  void _showSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
        ),
      );
    }
  }

  int _monthToInt(String month) {
    const months = {
      'January': 1,
      'February': 2,
      'March': 3,
      'April': 4,
      'May': 5,
      'June': 6,
      'July': 7,
      'August': 8,
      'September': 9,
      'October': 10,
      'November': 11,
      'December': 12,
    };
    return months[month] ?? 1;
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _insulinCarbController.dispose();
    _correctionFactorController.dispose();
    _proteinsController.dispose();
    _carbsController.dispose();
    _fatsController.dispose();
    _caloriesController.dispose();
    super.dispose();
  }
}
