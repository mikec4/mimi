import 'package:data_connection_checker/data_connection_checker.dart';

import 'network.dart';

class NetworkImpl implements Network{
  
  final DataConnectionChecker connectionChecker;

  NetworkImpl({this.connectionChecker});

  @override
  Future<bool> get isConnected async => connectionChecker.hasConnection;
   
}