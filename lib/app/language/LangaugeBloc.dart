import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motherclub/app/RegisterBloc/RegisterState.dart';
import 'package:motherclub/app/StateEnum.dart';
import 'package:motherclub/app/language/LanguageEvent.dart';
import 'package:motherclub/app/language/LanguageState.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  /// {@macro counter_bloc}
  LanguageBloc() : super(LanguageState(ResultState.Empty));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
        yield LanguageState(ResultState.Success , locale: event.locale);

  }
}