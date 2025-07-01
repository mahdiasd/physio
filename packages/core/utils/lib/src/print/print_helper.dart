class PrintHelper {
  // Print error message (red)
  static void error(String? message, {String? location}) {
    _printColored(
      message,
      colorCode: 31, // ANSI code for red
      label: 'ERROR',
      location: location,
    );
  }

  // Print info message (purple)
  static void info(String message, {String? location}) {
    _printColored(
      message,
      colorCode: 35, // ANSI code for purple
      label: 'INFO',
      location: location,
    );
  }

  // Print success message (green)
  static void success(String message, {String? location}) {
    _printColored(
      message,
      colorCode: 32, // ANSI code for green
      label: 'SUCCESS',
      location: location,
    );
  }

  // Print warning message (yellow)
  static void warning(String message, {String? location}) {
    _printColored(
      message,
      colorCode: 33, // ANSI code for yellow
      label: 'WARNING',
      location: location,
    );
  }

  // Main function for colored printing
  static void _printColored(
      String? message, {
        required int colorCode,
        required String label,
        String? location,
      }) {
    final header = '\x1B[${colorCode}m══╣ $label ${location != null ? '[$location]' : ''} ╠══\x1B[0m';
    final coloredMessage = '\x1B[${colorCode}m$message\x1B[0m';
    final separator = '\x1B[${colorCode}m' + ('═' * 80) + '\x1B[0m';

    print(separator);
    print(header);
    print(coloredMessage);
    print(separator);
  }
}

