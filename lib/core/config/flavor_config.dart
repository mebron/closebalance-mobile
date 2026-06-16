enum Flavor { closebalance, almadina }

class FlavorConfig {
  const FlavorConfig({required this.flavor});

  final Flavor flavor;

  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance!;
  static void setInstance(FlavorConfig config) => _instance = config;
}
