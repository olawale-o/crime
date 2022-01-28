class ProgressModel {
  final bool isLastStep;
  final int selectedIndex;
  const ProgressModel({ required this.isLastStep, required this.selectedIndex });

  ProgressModel copyWith({ bool? isLastStep, int? selectedIndex }) {
    return ProgressModel(
        isLastStep: isLastStep ?? this.isLastStep,
        selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
