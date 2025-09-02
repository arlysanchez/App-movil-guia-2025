import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myfirstlove/src/domain/utils/Resource.dart';
import 'package:myfirstlove/src/features/utils/BlocFormItem.dart';

class LoginState extends Equatable {
 final BlocFormItem email;
 final BlocFormItem password;
 final Resource? response;
 final GlobalKey<FormState>? formKey;


const LoginState(
  {
    this.email = const BlocFormItem(error: 'Ingresa el email'),
    this.password = const BlocFormItem(error: 'Ingresa el password'),
    this.formKey,
    this.response 
    });
 LoginState copyWith({ BlocFormItem? email,BlocFormItem? password,Resource? response, GlobalKey<FormState>? formKey
  }){
    return LoginState(email: email?? this.email,
                      password: password?? this.password,
                      formKey: formKey,
                      response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,response];


}