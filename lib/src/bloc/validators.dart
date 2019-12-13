import 'dart:async';

class Validators {

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink){
      if(password.length >= 6){
        sink.add(password);
      }
      else
      {
        sink.addError('Profavor trate de agregar mas de 6 caracter');
      }
    }
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    //El correo lo validamos una exprecion regular usando en patern
    handleData: ( email, sink){

      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      RegExp regExp = new RegExp(pattern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }
      else 
      {
        sink.addError('No  es un correo valido');
      }
    }
  );
}