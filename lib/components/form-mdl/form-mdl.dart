import 'dart:convert';
import 'package:angular2/common.dart';
import 'package:angular2/core.dart';

@Component(
    selector: 'form-mdl',
    templateUrl: 'form-mdl.html',
    styleUrls: const ['form-mdl.css'])
class FormMDL implements OnInit {
  ControlGroup userForm;

  FormMDL(FormBuilder fb) {
    userForm = fb.group({
      "name": ['', Validators.required],
      "age": new Control(0),
      "genre": [ null, Validators.required],
      "newsletter": new Control(true)
    });
  }

  @override
  ngOnInit() {}

  String get value {
    return JSON.encode(userForm.value);
  }

  onSubmit(){
    print('FormMDL.onSubmit » value ${value}');
  }

  /// soit fonction Compo
  /// soit ds template : `f.form.controls['genre'].updateValue('2')`
  updateModel(String propName, String v) {
    (userForm.controls[propName] as Control).updateValue(v);
    print('FormMDL.onSubmit » value ${value}');
    print('FormMDL.updateModel  userForm.valid ${userForm.valid}');
  }
}
