




class Util {
  static dynamic getValueFromJson(json, String key, dynamic defaultValue) {
    if (json.containsKey(key) && json[key] != null) return json[key];
    return defaultValue;
  }

}