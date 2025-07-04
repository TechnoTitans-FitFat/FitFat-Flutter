import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/diet_info_cubit/update_diet_info_cubit.dart';
import '../cubit/health_info_cubit/update_health_info_cubit.dart';
import 'general_info_section.dart';
import 'health_info_section.dart';
import 'nutrition_info_section.dart';

class EditProfileScreen extends StatefulWidget {
  final String userId;
  final Map<String, dynamic> initialData;

  const EditProfileScreen({
    Key? key,
    required this.userId,
    required this.initialData,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _insulinCarbController;
  late TextEditingController _correctionFactorController;
  late TextEditingController _proteinsController;
  late TextEditingController _carbsController;
  late TextEditingController _fatsController;
  late TextEditingController _caloriesController;

  late String _selectedGender;
  late String _selectedMonth;
  late String _selectedDay;
  late String _selectedYear;
  late String _selectedAllergy;
  late String _selectedDietType;
  late String _selectedDietaryGoal;
  late String _selectedActivityLevel;
  late String _selectedMealPreference;
  late String _selectedDiabetesType;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeDropdownValues();
  }

  void _initializeControllers() {
    _heightController = TextEditingController(
      text: widget.initialData['height']?.toString() ?? '180',
    );
    _weightController = TextEditingController(
      text: widget.initialData['weight']?.toString() ?? '80',
    );
    _insulinCarbController = TextEditingController(
      text: widget.initialData['insulinToCarbRatio']?.toString() ?? '0.2',
    );
    _correctionFactorController = TextEditingController(
      text: widget.initialData['correctionFactor']?.toString() ?? '0.5',
    );
    _proteinsController = TextEditingController(
      text: widget.initialData['macronutrientGoals']?['proteins']?.toString() ??
          '100',
    );
    _carbsController = TextEditingController(
      text: widget.initialData['macronutrientGoals']?['carbs']?.toString() ??
          '50',
    );
    _fatsController = TextEditingController(
      text:
          widget.initialData['macronutrientGoals']?['fats']?.toString() ?? '70',
    );
    _caloriesController = TextEditingController(
      text: widget.initialData['macronutrientGoals']?['calories']?.toString() ??
          '1500',
    );
  }

  void _initializeDropdownValues() {
    _selectedGender = widget.initialData['gender'] ?? 'female';
    _selectedMonth = _extractMonth(widget.initialData['dateOfBirth']) ?? '01';
    _selectedDay = _extractDay(widget.initialData['dateOfBirth']) ?? '01';
    _selectedYear = _extractYear(widget.initialData['dateOfBirth']) ?? '1990';
    _selectedAllergy = widget.initialData['foodAllergies'] ?? 'Peanuts';
    _selectedDietType = widget.initialData['dietType'] ?? 'Keto';
    _selectedDietaryGoal = widget.initialData['dietaryGoals'] ?? 'Weight Loss';
    _selectedActivityLevel =
        widget.initialData['activityLevel'] ?? 'Moderately Active';
    _selectedMealPreference =
        widget.initialData['mealPreferences'] ?? 'Vegetarian';
    _selectedDiabetesType = widget.initialData['diabetesType'] ?? 'Type 1';
  }

  String? _extractMonth(dynamic date) {
    if (date == null) return null;
    if (date is String) {
      return date.split('-')[1];
    } else if (date is Map) {
      return date['month']?.toString().padLeft(2, '0');
    }
    return null;
  }

  String? _extractDay(dynamic date) {
    if (date == null) return null;
    if (date is String) {
      return date.split('-')[2].split('T')[0];
    } else if (date is Map) {
      return date['day']?.toString().padLeft(2, '0');
    }
    return null;
  }

  String? _extractYear(dynamic date) {
    if (date == null) return null;
    if (date is String) {
      return date.split('-')[0];
    } else if (date is Map) {
      return date['year']?.toString();
    }
    return null;
  }

  String _monthToNumber(String month) {
    const months = {
      'January': '01',
      'February': '02',
      'March': '03',
      'April': '04',
      'May': '05',
      'June': '06',
      'July': '07',
      'August': '08',
      'September': '09',
      'October': '10',
      'November': '11',
      'December': '12',
    };
    return months[month] ?? month;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8D7DA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8D7DA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
      ),
      body: BlocListener<UpdateHealthInfoCubit, UpdateHealthInfoState>(
        listener: (context, state) {
          if (state is UpdateHealthInfoLoaded) {
            final healthInfo = state.healthInfo;
            setState(() {
              _heightController.text = healthInfo.height.toString();
              _weightController.text = healthInfo.weight.toString();
              _selectedGender = healthInfo.gender;
              _selectedMonth =
                  healthInfo.dateOfBirth.month.toString().padLeft(2, '0');
              _selectedDay =
                  healthInfo.dateOfBirth.day.toString().padLeft(2, '0');
              _selectedYear = healthInfo.dateOfBirth.year.toString();
              _selectedAllergy = healthInfo.foodAllergies;
              _selectedDiabetesType = healthInfo.diabetesType;
              _insulinCarbController.text =
                  healthInfo.insulinToCarbRatio.toString();
              _correctionFactorController.text =
                  healthInfo.correctionFactor.toString();
            });
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GeneralInfoSection(
                  selectedGender: _selectedGender,
                  selectedMonth: _selectedMonth,
                  selectedDay: _selectedDay,
                  selectedYear: _selectedYear,
                  heightController: _heightController,
                  weightController: _weightController,
                  onGenderChanged: (value) =>
                      setState(() => _selectedGender = value),
                  onMonthChanged: (value) =>
                      setState(() => _selectedMonth = value),
                  onDayChanged: (value) => setState(() => _selectedDay = value),
                  onYearChanged: (value) =>
                      setState(() => _selectedYear = value),
                ),
                const SizedBox(height: 20),
                HealthInfoSection(
                  selectedAllergy: _selectedAllergy,
                  selectedDiabetesType: _selectedDiabetesType,
                  insulinCarbController: _insulinCarbController,
                  correctionFactorController: _correctionFactorController,
                  onAllergyChanged: (value) =>
                      setState(() => _selectedAllergy = value),
                  onDiabetesTypeChanged: (value) =>
                      setState(() => _selectedDiabetesType = value!),
                ),
                const SizedBox(height: 20),
                NutritionInfoSection(
                  selectedDietType: _selectedDietType,
                  selectedDietaryGoal: _selectedDietaryGoal,
                  selectedActivityLevel: _selectedActivityLevel,
                  selectedMealPreference: _selectedMealPreference,
                  proteinsController: _proteinsController,
                  carbsController: _carbsController,
                  fatsController: _fatsController,
                  caloriesController: _caloriesController,
                  onDietTypeChanged: (value) =>
                      setState(() => _selectedDietType = value),
                  onDietaryGoalChanged: (value) =>
                      setState(() => _selectedDietaryGoal = value),
                  onActivityLevelChanged: (value) =>
                      setState(() => _selectedActivityLevel = value),
                  onMealPreferenceChanged: (value) =>
                      setState(() => _selectedMealPreference = value),
                ),
                const SizedBox(height: 30),
                BlocBuilder<UpdateHealthInfoCubit, UpdateHealthInfoState>(
                  builder: (context, healthState) {
                    return BlocBuilder<UpdateDietInfoCubit,
                        UpdateDietInfoState>(
                      builder: (context, dietState) {
                        final isLoading = dietState is UpdateDietInfoLoading ||
                            healthState is UpdateHealthInfoLoading;
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _updateProfile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
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
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) {
      _showSnackBar(
          context, 'Please fill all required fields correctly', Colors.red);
      print('Form validation failed');
      return;
    }

    try {
      final dietInfo = DietInfo(
        dietType: _selectedDietType,
        macronutrientGoals: MacronutrientGoals(
          proteins: double.parse(_proteinsController.text).toInt(),
          carbs: double.parse(_carbsController.text).toInt(),
          fats: double.parse(_fatsController.text).toInt(),
          calories: double.parse(_caloriesController.text).toInt(),
        ),
        dietaryGoals: _selectedDietaryGoal,
        activityLevel: _selectedActivityLevel,
        mealPreferences: _selectedMealPreference,
      );

      final healthInfo = HealthInfo(
        foodAllergies: _selectedAllergy,
        diabetes: _selectedDiabetesType.isNotEmpty,
        weight: int.tryParse(_weightController.text) ?? 0,
        height: int.tryParse(_heightController.text) ?? 0,
        dateOfBirth: DateTime(
          int.parse(_selectedYear),
          int.parse(_monthToNumber(_selectedMonth)),
          int.parse(_selectedDay.padLeft(2, '0')),
        ),
        gender: _selectedGender,
        targetBloodSugarRange: const BloodSugarRange(min: 50, max: 120),
        diabetesType: _selectedDiabetesType,
        insulinToCarbRatio: double.tryParse(_insulinCarbController.text) ?? 0.0,
        correctionFactor:
            double.tryParse(_correctionFactorController.text) ?? 0.0,
      );

      print('Sending DietInfo: $dietInfo');
      print('Sending HealthInfo: $healthInfo');

      await context
          .read<UpdateDietInfoCubit>()
          .updateDietInfo(widget.userId, dietInfo);
      await context
          .read<UpdateHealthInfoCubit>()
          .updateHealthInfo(widget.userId, healthInfo);

      final dietState = context.read<UpdateDietInfoCubit>().state;
      final healthState = context.read<UpdateHealthInfoCubit>().state;

      if (dietState is UpdateDietInfoLoaded &&
          healthState is UpdateHealthInfoLoaded) {
        _showSnackBar(context, 'Profile updated successfully!', Colors.green);
        print(
            'Profile updated successfully with DietInfo: $dietInfo and HealthInfo: $healthInfo');
        Navigator.pop(context, true); // Return true to indicate success
      } else {
        String errorMessage = 'Failed to update profile';
        if (dietState is UpdateDietInfoError) {
          errorMessage += ': DietInfo - ${dietState.message}';
        }
        if (healthState is UpdateHealthInfoError) {
          errorMessage += ': HealthInfo - ${healthState.message}';
        }
        _showSnackBar(context, errorMessage, Colors.red);
        print(errorMessage);
      }
    } catch (e) {
      _showSnackBar(context, 'Error updating profile: $e', Colors.red);
      print('Error updating profile: $e');
    }
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
