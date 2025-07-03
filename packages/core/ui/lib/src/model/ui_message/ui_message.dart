import 'package:utils/utils.dart';

enum UiMessageStatus { Error, Success, Warning }

enum UiMessageType { Device, Network }

class UiMessage {
  final String message;
  final UiMessageStatus status;
  final UiMessageType type;

  UiMessage({
    required this.message,
    this.status = UiMessageStatus.Error,
    this.type = UiMessageType.Device,
  });

  /// Factory constructor for success messages with device type
  factory UiMessage.success(
    String message, {
    UiMessageType type = UiMessageType.Device,
  }) {
    return UiMessage(
      message: message,
      status: UiMessageStatus.Success,
      type: type,
    );
  }

  /// Factory constructor for error messages with device type
  factory UiMessage.error(
    String message, {
    UiMessageType type = UiMessageType.Device,
  }) {
    return UiMessage(
      message: message,
      status: UiMessageStatus.Error,
      type: type,
    );
  }
}

extension ErrorToUiMessageExt on AppException {
  UiMessage toUiMessage({String? fallbackMessage = null}) {
    return UiMessage(
      message: message ?? fallbackMessage ?? "",
      status: UiMessageStatus.Error,
      type: UiMessageType.Network,
    );
  }
}
