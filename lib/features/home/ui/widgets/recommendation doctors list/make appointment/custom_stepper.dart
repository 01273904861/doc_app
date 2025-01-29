import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

/// Custom Stepper UI
class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    required this.onStepTapped,
  });
  final int currentStep;
  final List<StepData> steps;
  final Function(int) onStepTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(steps.length, (int index) {
        final bool isActive = index == currentStep;
        final bool isCompleted = index < currentStep;

        return GestureDetector(
          onTap: () => onStepTapped(index),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: isActive ? 22 : 18,
                backgroundColor: isActive
                    ? AppColors.mainBlue
                    : (isCompleted ? Colors.blueGrey : Colors.grey[300]),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isActive ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                steps[index].title,
                style: TextStyle(
                  fontSize: 14,
                  color: isActive ? Colors.black : Colors.grey,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class StepData {
  StepData({required this.title, required this.content});
  final String title;
  final Widget content;
}
