import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {

  SocketService(this.socketUrl);
  final String socketUrl;

  IO.Socket initSocket() {
    IO.Socket socket = IO.io(socketUrl,
        OptionBuilder()
            .setTransports(['websocket']).build());
    socket.onConnect((_) => print('connected'));
    socket.onDisconnect((_) => print('disconnect'));
    return socket;
  }

}
