import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/api/Endpoints.dart';
import 'package:flutterdemo/utils/models/FormData.dart';
import 'package:flutterdemo/utils/models/SuccessResponse.dart';
import 'package:flutterdemo/widgets/alert.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormFeedback extends StatefulWidget {
  const FormFeedback({super.key});

  @override
  State<FormFeedback> createState() => _FormFeedbackState();
}

class _FormFeedbackState extends State<FormFeedback> {
  final formKey = GlobalKey<FormState>();
  final FormData formData = FormData(
    name: '',
    surname: '',
    secondname: '',
    email: '',
    phone: '',
  );

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    return null;
  }

  String? validateEmail(String? value) {
    const pattern =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Неверный email'
        : null;
  }

  String? validatePhone(String? value) {
    const pattern = r'^(\+7\(\d{3}\)-\d{3}-\d{2}-\d{2})$';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Неверный номер телефона'
        : null;
  }

  void onSubmit(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    await Endpoints.sendFeedback(formData)
        .then((SuccessResponse response) {
          if (!context.mounted) {
            return;
          }
          showDialog(
            context: context,
            builder: (BuildContext alertContext) {
              return Alert(
                title: 'Успешно',
                content: response.message,
                onClose: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        })
        .catchError((exception) {
          if (!context.mounted) {
            return;
          }
          showDialog(
            context: context,
            builder: (BuildContext alertContext) {
              return Alert(
                title: 'Ошибка',
                content: exception.message,
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: <Widget>[
          Text(
            "Форма обратной связи",
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Имя'),
              hintText: 'Введите имя',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validateText(value),
            initialValue: formData.name,
            onChanged: (value) => setState(() {
              formData.name = value;
            }),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Фамилия'),
              hintText: 'Введите фамилию',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validateText(value),
            initialValue: formData.secondname,
            onChanged: (value) => setState(() {
              formData.secondname = value;
            }),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Отчество'),
              hintText: 'Введите отчество',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validateText(value),
            initialValue: formData.surname,
            onChanged: (value) => setState(() {
              formData.surname = value;
            }),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Email'),
              hintText: 'Введите email',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              String? validationResult = validateText(value);
              validationResult ??= validateEmail(value);
              return validationResult;
            },
            initialValue: formData.email,
            onChanged: (value) => setState(() {
              formData.email = value;
            }),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Телефон'),
              hintText: 'Введите номер телефона',
            ),
            inputFormatters: [
              MaskTextInputFormatter(mask: "+7(###)-###-##-##"),
            ],
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              String? validationResult = validateText(value);
              validationResult ??= validatePhone(value);
              return validationResult;
            },
            initialValue: formData.phone,
            onSaved: (value) => setState(() {
              formData.phone = value ?? "";
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.indigo,
                  ),
                ),
                onPressed: () => onSubmit(context),
                child: Text('Отправить', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
