import 'dart:developer';

import 'package:ai_app/helper/global.dart';
import 'package:appwrite/appwrite.dart';

class AppWrite{

  static final _client = Client();
  static final _database = Databases(_client);

  static void init(){

    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65a339f15d87e00ea3bb')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async{
    try{
      final d = await _database.getDocument(
          databaseId: 'MyDatabase',
          collectionId: 'ApiKey',
          documentId: 'chatGptKey');


      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    }catch(e){
      log('$e');
      return '';
    }
  }

}