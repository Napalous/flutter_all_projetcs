class NapalEnvConfig {
  String appName = "";
  String baseUrl = "";
  String countryCode = "";
  String langue = "en";
  Map<String, String> sockets;
  List<String> publicApis;
  String env = "dev";

  static NapalEnvConfig shared = NapalEnvConfig.create();

  factory NapalEnvConfig.create({
    String appName = "",
    String baseUrl = "",
    String countryCode = "",
    String langue = "en",
    Map<String, String> sockets = const {},
    List<String> publicApis = const [], 
    env = "dev"
  }) {
    return shared = NapalEnvConfig(appName, baseUrl, countryCode, langue, sockets, publicApis, env);
  }

  NapalEnvConfig(this.appName, this.baseUrl, this.countryCode, this.langue, this.sockets, this.publicApis, this.env);
}
