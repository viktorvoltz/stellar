import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class StellarClient {
  final StellarSDK sdk = StellarSDK.TESTNET;
  late KeyPair keyPair;

  StellarClient(){
    keyPair = KeyPair.random();
  }

  String accountId(){
    return keyPair.accountId;
  }

  String secretSeed(){
    return keyPair.secretSeed;
  }

  Future<String> mnemonic() async{
    String str =  await Wallet.generate24WordsMnemonic();
    return str;
  }

  Future<List<String>> generateKeyPairs(String seed) async {
    List<String> keyPairs = [];
    Wallet wallet = await Wallet.from(seed);

    KeyPair keyPair0 = await wallet.getKeyPair(index: 0);
    keyPairs.add(keyPair0.secretSeed);

    KeyPair keyPair1 = await wallet.getKeyPair(index: 1);
    keyPairs.add(keyPair1.secretSeed);

    return keyPairs;
  }
}