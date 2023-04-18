import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:attendance_server/domain/student.dart';
import 'package:attendance_server/provider/client.dart';
import 'package:flutter/material.dart';

import '../main.dart';

// import 'package:wifi/wifi.dart';
enum ServerState { none,starting, running, failed, close }

class ServerProvider extends ChangeNotifier {
  final List<Client> _clients =[];
  late ServerSocket server;

  ServerState serverState = ServerState.none;

  ServerProvider() {
    start();
  }

  Future<void> start() async {
    try {
      serverState = ServerState.starting;
      notifyListeners();
      server = await ServerSocket.bind(await _getIP(), 45000, shared: true);
      serverState = ServerState.running;
      notifyListeners();


    } catch (e) {
      logger.e(e.toString());
      serverState = ServerState.failed;
      notifyListeners();

    }

    logger.d(
        "server: running in ip :${server.address} :and port ${server.port}");
    _listenToSocket();
  }

  void _listenToSocket() {
    server.listen(
        (socket) {
          handleConnection(socket);
        },
        onDone: close,
        onError: (e) {
          serverState = ServerState.failed;
          logger.e(e.toString());
          notifyListeners();

        });
  }

  Future<void> close() async {
    await server.close();
    serverState = ServerState.close;
    logger.d("server Done");
    notifyListeners();

  }

  handleConnection(Socket socket) async {
    final client =Client(socket: socket);
    client.onConnect();
    socket.listen((Uint8List data) {
      final message = utf8.decoder.convert(data);
      var temp = _clients.where((element) => element.socket == socket).toList();

      if (temp.isEmpty) {
        addToServer(message, socket);
      }
      // else {
      //   for (Client client in _clients) {
      //     client.socket.write("${temp[0].student.name} : $message");
      //   }
      //   // setState();
      // }
    }, onError: (error) {
      client.onError(error);
      remove(socket);

    }, onDone: () {
      remove(socket);
    });
  }

  void addToServer(String message, Socket socket) {
    try {
      Map<String, dynamic> json = jsonDecode(message);
      Student student = Student.fromJson(json);
      var temp= _clients.where((element) => element.student?.id==student.id);

      if (temp.isEmpty) {
        _clients.add(Client(socket: socket,student: student));
        notifyListeners();

        // setState();
      }

    } catch (error) {
      logger.e(error.toString());
      remove(socket);
    }
  }

  // void display(String message) {
  //   DateTime date = DateTime.now();
  //   String dataFormat = "${date.hour}:${date.minute}:${date.second} ";
  //   _messages.add("$dataFormat $message");
  //   // setState();
  // }

  void remove(Socket client) {
    client.close();
    var temp = _clients.where((element) => element.socket == client);
    _clients.remove(temp.first);
    logger.d("${temp.first.student?.name} is left");
  }

  Future<String?> _getIP() async {
    for (var interface in await NetworkInterface.list()) {
      // ('== Interface: ${interface.name} ==');
      for (var address in interface.addresses) {
        if (address.type == InternetAddressType.IPv4) return address.address;
      }
    }
    return null;
  }
}
