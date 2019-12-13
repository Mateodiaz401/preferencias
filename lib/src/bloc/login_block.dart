

import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

//usamos un mixin para vincular el validators BehaviorSubject que es objeto de rxdart 
//ya viene  con brotcast.
class LoginBloc with Validators{

  //Cambiar el StreamController 
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar los datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  //Usando  rxdart usando el conbai
  Stream<bool> get formValidStream => 
      Observable.combineLatest2(emailStream, passwordStream, (e,p)=> true);

  //insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePasword => _passwordController.sink.add;
  
  //crear el geter  seter para obtener el valor ingresado a los stream
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}