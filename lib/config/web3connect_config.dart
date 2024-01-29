import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class TWebConnectConfig {
  final _w3mService = W3MService(
    projectId: '91fea5ea39fc5898af040c6fd6c478c2',
    metadata: const PairingMetadata(
      name: 'Web 3 Flutter App',
      description: 'Web3 flutter app',
      url: 'https://www.walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
      redirect: Redirect(
        native: 'web_3_app://',
        universal: 'https://www.walletconnect.com',
      ),
    ),
  );

  Future<void> init() async {
    await _w3mService.init();
  }

  W3MService get service => _w3mService;

  Future<void> disconnect() async {
    await _w3mService.disconnect();
  }

  Future<void> launchConnectedWallet() async {
    await _w3mService.launchConnectedWallet();
  }

  Future<void> signMessage(String message) async {
    final walletAdress = _w3mService.session?.address;
    const  methode = 'personal_sign';
    if (walletAdress == null) {
      debugPrint("Wallet address is null");
      return;
    }

    await _w3mService.web3App!.request(
      topic: _w3mService.session?.topic ?? "",
      chainId: 'eip155:1',
      request: SessionRequestParams(
        method: methode,
        params: [message, walletAdress],
      ),
    );
  }
}
