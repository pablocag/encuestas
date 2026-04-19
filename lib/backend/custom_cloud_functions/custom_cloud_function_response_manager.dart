import '/backend/schema/structs/index.dart';

class LogoutUsuariosCloudFunctionCallResponse {
  LogoutUsuariosCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class CheckUsuariosOnLineCloudFunctionCallResponse {
  CheckUsuariosOnLineCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  UsuariosOnLineStruct? data;
}
