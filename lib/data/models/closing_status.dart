enum ClosingStatus {
  draft,
  finalized;

  static ClosingStatus fromString(String value) =>
      value == 'finalized' ? ClosingStatus.finalized : ClosingStatus.draft;

  bool get isFinalized => this == ClosingStatus.finalized;
}
