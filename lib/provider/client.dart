import 'dart:convert';
import 'dart:io';

import 'package:attendance_server/main.dart';

import '../domain/student.dart';

class Client {
  Socket socket;
  Student? student;
  Client({required this.socket,this.student });

  void onConnect() {
    logger.d('connecting from  ${socket.address}');
    socket.write('connection successfully');
  }

  void onData(List<int> data) {
    final message = utf8.decoder.convert(data);

    logger.d('Received data: $message');
  }

  void onError(dynamic error) {
    logger.e('Client error: $error');
  }

  void onDisconnect() {
    logger.d(
        'Client disconnected: ${socket.remoteAddress.address}:${socket.remotePort}');
  }
}
