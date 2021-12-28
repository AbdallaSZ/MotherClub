import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/Models/RegisterRequestModel.dart';
import 'package:motherclub/app/RegisterBloc/RegisterRepo.dart';
import 'package:motherclub/app/RegisterBloc/RegisterState.dart';
import 'package:motherclub/app/StateEnum.dart';

abstract class BaseEvent {}

/// Notifies bloc to register state.
class RegisterEvent extends BaseEvent {
  RegisterRequestModel model;

  RegisterEvent(this.model);


}


/// {@template counter_bloc}
/// A simple [Bloc] that manages an `RegisterState` as its state.
/// {@endtemplate}
class RegisterBloc extends Bloc<BaseEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(resultState: ResultState.Empty));
  /// {@macro counter_bloc}

@override
  Stream<RegisterState> mapEventToState(BaseEvent event) async*{
    // TODO: implement mapEventToState
    if(event is RegisterEvent){
      try{
        yield RegisterState(resultState: ResultState.Loading );

        var result =await RegisterRepo.Register(event.model);
         if(result is String )
           yield RegisterState(resultState: ResultState.Error , errorMessage: result);
else
      yield RegisterState(resultState: ResultState.Success , model: result);
    }catch(e){
        print(e.toString());
        yield RegisterState(resultState: ResultState.Error , errorMessage: e.toString());

      }
    }
  }

}

