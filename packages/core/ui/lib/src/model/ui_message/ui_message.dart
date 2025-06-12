import 'package:utils/utils.dart';

enum UiMessageStatus { Error, Success, Warning }

enum UiMessageType { Device, Network }

class UiMessage {
  final String message;
  final UiMessageStatus status;
  final UiMessageType type;

  UiMessage({
    required this.message,
    this.status = UiMessageStatus.Success,
    this.type = UiMessageType.Device,
  });
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
