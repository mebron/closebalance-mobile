enum DeductionType {
  salaryAdvance('salary_advance', 'Salary Advance'),
  incentive('incentive', 'Incentive'),
  other('other', 'Other');

  const DeductionType(this.value, this.label);
  final String value;
  final String label;

  static DeductionType fromValue(String v) =>
      values.firstWhere((e) => e.value == v, orElse: () => DeductionType.other);
}
