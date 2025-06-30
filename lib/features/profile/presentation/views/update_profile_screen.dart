import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> initialData;

  const EditProfileScreen({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Form controllers
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _insulinCarbController;
  late TextEditingController _correctionFactorController;
  late TextEditingController _proteinsController;
  late TextEditingController _carbsController;
  late TextEditingController _fatsController;
  late TextEditingController _caloriesController;

  // Dropdown values
  late String selectedGender;
  late String selectedMonth;
  late String selectedDay;
  late String selectedYear;
  late String selectedAllergy;
  late String selectedDietType;
  late String selectedDietaryGoal;
  late String selectedActivityLevel;
  late String selectedMealPreference;
  late String selectedDiabetesType;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeDropdownValues();
  }

  void _initializeControllers() {
    _heightController = TextEditingController(
        text: widget.initialData['height']?.toString() ?? '170');
    _weightController = TextEditingController(
        text: widget.initialData['weight']?.toString() ?? '70');
    _insulinCarbController = TextEditingController(
        text: widget.initialData['insulinToCarbRatio']?.toString() ?? '15');
    _correctionFactorController = TextEditingController(
        text: widget.initialData['correctionFactor']?.toString() ?? '50');
    _proteinsController = TextEditingController(
        text:
            widget.initialData['macronutrientGoals']?['proteins']?.toString() ??
                '100');
    _carbsController = TextEditingController(
        text: widget.initialData['macronutrientGoals']?['carbs']?.toString() ??
            '50');
    _fatsController = TextEditingController(
        text: widget.initialData['macronutrientGoals']?['fats']?.toString() ??
            '70');
    _caloriesController = TextEditingController(
        text:
            widget.initialData['macronutrientGoals']?['calories']?.toString() ??
                '1500');
  }

  void _initializeDropdownValues() {
    selectedGender = widget.initialData['gender'] ?? 'Female';
    selectedMonth = widget.initialData['dateOfBirth']?['month'] ?? 'Month';
    selectedDay = widget.initialData['dateOfBirth']?['day'] ?? 'Day';
    selectedYear = widget.initialData['dateOfBirth']?['year'] ?? 'Year';
    selectedAllergy = widget.initialData['allergies'] ?? 'Peanuts';
    selectedDietType = widget.initialData['dietType'] ?? 'Keto';
    selectedDietaryGoal = widget.initialData['dietaryGoals'] ?? 'Weight Loss';
    selectedActivityLevel =
        widget.initialData['activityLevel'] ?? 'Moderately Active';
    selectedMealPreference =
        widget.initialData['mealPreferences'] ?? 'Vegetarian';
    selectedDiabetesType = widget.initialData['diabetesType'] ?? 'Type 2';
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
      body: SingleChildScrollView(
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
              onGenderChanged: (value) =>
                  setState(() => selectedGender = value),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile() {
    Map<String, dynamic> profileData = {
      'gender': selectedGender,
      'dateOfBirth': {
        'month': selectedMonth,
        'day': selectedDay,
        'year': selectedYear,
      },
      'height': int.tryParse(_heightController.text) ?? 0,
      'weight': int.tryParse(_weightController.text) ?? 0,
      'allergies': selectedAllergy,
      'diabetesType': selectedDiabetesType,
      'insulinToCarbRatio': int.tryParse(_insulinCarbController.text) ?? 0,
      'correctionFactor': int.tryParse(_correctionFactorController.text) ?? 0,
      'dietType': selectedDietType,
      'macronutrientGoals': {
        'proteins': int.tryParse(_proteinsController.text) ?? 0,
        'carbs': int.tryParse(_carbsController.text) ?? 0,
        'fats': int.tryParse(_fatsController.text) ?? 0,
        'calories': int.tryParse(_caloriesController.text) ?? 0,
      },
      'dietaryGoals': selectedDietaryGoal,
      'activityLevel': selectedActivityLevel,
      'mealPreferences': selectedMealPreference,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    print('Profile Data: $profileData');
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

// Reusable Stateless Widgets

class GeneralInfoSection extends StatelessWidget {
  final String selectedGender;
  final String selectedMonth;
  final String selectedDay;
  final String selectedYear;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onMonthChanged;
  final ValueChanged<String> onDayChanged;
  final ValueChanged<String> onYearChanged;

  const GeneralInfoSection({
    Key? key,
    required this.selectedGender,
    required this.selectedMonth,
    required this.selectedDay,
    required this.selectedYear,
    required this.heightController,
    required this.weightController,
    required this.onGenderChanged,
    required this.onMonthChanged,
    required this.onDayChanged,
    required this.onYearChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      'General Information',
      [
        CustomDropdown(
          label: 'Gender',
          value: selectedGender,
          items: ['Male', 'Female', 'Other'],
          onChanged: onGenderChanged,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date of Birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    label: 'Month',
                    value: selectedMonth,
                    items: [
                      'Month',
                      'January',
                      'February',
                      'March',
                      'April',
                      'May',
                      'June',
                      'July',
                      'August',
                      'September',
                      'October',
                      'November',
                      'December'
                    ],
                    onChanged: onMonthChanged,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDropdown(
                    label: 'Day',
                    value: selectedDay,
                    items:
                        ['Day'] + List.generate(31, (index) => '${index + 1}'),
                    onChanged: onDayChanged,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomDropdown(
                    label: 'Year',
                    value: selectedYear,
                    items: ['Year'] +
                        List.generate(50, (index) => '${2024 - index}'),
                    onChanged: onYearChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Height',
                controller: heightController,
                unit: 'cm',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Weight',
                controller: weightController,
                unit: 'kg',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class HealthInfoSection extends StatelessWidget {
  final String selectedAllergy;
  final String selectedDiabetesType;
  final TextEditingController insulinCarbController;
  final TextEditingController correctionFactorController;
  final ValueChanged<String> onAllergyChanged;
  final ValueChanged<String?>? onDiabetesTypeChanged;

  const HealthInfoSection({
    Key? key,
    required this.selectedAllergy,
    required this.selectedDiabetesType,
    required this.insulinCarbController,
    required this.correctionFactorController,
    required this.onAllergyChanged,
    required this.onDiabetesTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      'Health Information',
      [
        CustomDropdown(
          label: 'Allergies',
          value: selectedAllergy,
          items: ['None', 'Peanuts', 'Dairy', 'Gluten', 'Shellfish'],
          onChanged: onAllergyChanged,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type of Diabetes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Radio<String>(
                  value: 'Type 1',
                  groupValue: selectedDiabetesType,
                  onChanged: onDiabetesTypeChanged,
                  activeColor: Colors.red,
                ),
                const Text('Type 1'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Type 2',
                  groupValue: selectedDiabetesType,
                  onChanged: onDiabetesTypeChanged,
                  activeColor: Colors.red,
                ),
                const Text('Type 2'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Insulin-to-Carb Ratio',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('1:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: CustomTextField(
                    label: 'Insulin-to-Carb',
                    controller: insulinCarbController,
                    showLabel: false,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your Correction Factor?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('1 Unit Lowers Blood Sugar By:',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: CustomTextField(
                    label: 'Correction Factor',
                    controller: correctionFactorController,
                    showLabel: false,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('mg/dL', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class NutritionInfoSection extends StatelessWidget {
  final String selectedDietType;
  final String selectedDietaryGoal;
  final String selectedActivityLevel;
  final String selectedMealPreference;
  final TextEditingController proteinsController;
  final TextEditingController carbsController;
  final TextEditingController fatsController;
  final TextEditingController caloriesController;
  final ValueChanged<String> onDietTypeChanged;
  final ValueChanged<String> onDietaryGoalChanged;
  final ValueChanged<String> onActivityLevelChanged;
  final ValueChanged<String> onMealPreferenceChanged;

  const NutritionInfoSection({
    Key? key,
    required this.selectedDietType,
    required this.selectedDietaryGoal,
    required this.selectedActivityLevel,
    required this.selectedMealPreference,
    required this.proteinsController,
    required this.carbsController,
    required this.fatsController,
    required this.caloriesController,
    required this.onDietTypeChanged,
    required this.onDietaryGoalChanged,
    required this.onActivityLevelChanged,
    required this.onMealPreferenceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      'Nutrition Information',
      [
        CustomDropdown(
          label: 'Diet Type',
          value: selectedDietType,
          items: ['Keto', 'Paleo', 'Mediterranean', 'Low Carb', 'Balanced'],
          onChanged: onDietTypeChanged,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Macronutrient Goals',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Proteins',
                    controller: proteinsController,
                    unit: 'g',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    label: 'Carbs',
                    controller: carbsController,
                    unit: 'g',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Fats',
                    controller: fatsController,
                    unit: 'g',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    label: 'Calories',
                    controller: caloriesController,
                    unit: 'kcal',
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Dietary Goals',
          value: selectedDietaryGoal,
          items: [
            'Weight Loss',
            'Weight Gain',
            'Maintenance',
            'Muscle Building'
          ],
          onChanged: onDietaryGoalChanged,
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Activity Level',
          value: selectedActivityLevel,
          items: [
            'Sedentary',
            'Lightly Active',
            'Moderately Active',
            'Very Active',
            'Extremely Active'
          ],
          onChanged: onActivityLevelChanged,
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Meal Preferences',
          value: selectedMealPreference,
          items: [
            'Vegetarian',
            'Vegan',
            'Pescatarian',
            'Omnivore',
            'Carnivore'
          ],
          onChanged: onMealPreferenceChanged,
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: items.contains(value) ? value : items.first,
              isExpanded: true,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: item == label ? Colors.grey : Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) => onChanged(newValue!),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? unit;
  final bool showLabel;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.unit,
    this.showLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        if (showLabel) const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixText: unit,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
