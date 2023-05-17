# flutter_static_utility
awesome flutter common utils

[![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## 📋 Util lists

- checkEmailRegex
- checkPhoneNumberRegex(Korean)
- checkNickNameRegex(Korean)
- checkSMSCodeRegex
- checkPasswordRegex
- timeAgo
- thousandToK
- thousandToData

## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


```yaml
dependencies:
  flutter_utils: ^<latest_version>
```

## 💪 Use

---
#### checkEmailRegex

```dart
const result = checkEmailRegex(email: 'example@google.com');
/// return true;
```
---
#### checkPhoneNumberRegex

```dart
const result = checkPhoneNumberRegex(phoneNumber: '01012341234');
/// return true;
/// it works only korean phone number
/// global phone number will be updated
```
---

#### checkNickNameRegex

```dart
const result = checkNickNameRegex(nickName: 'NickName', min: 2, max: 8);
/// return true;
```
---

#### checkSMSCodeRegex

```dart
const result = checkSMSCodeRegex(code: '123456', length: 6);
/// return true;
```
---

#### checkPasswordRegex

```dart
const result = checkPasswordRegex(password: 'Abcd1234!', min: 8, max: 20);
/// return true;
/// Upper, Lower, Number, Special Character
```
---

#### timeAgo
```dart
const result = timeAgo(dateTime: DateTime.now());
/// return 'Just now';
/// 3 seconds ago ..
/// 2 week ago
```
---

#### thousandToK
```dart
const result = thousandToK(30000);
/// return '30.0K';
```
---

#### thousandToData
```dart
const result = thousandToData(30000);
/// return DigitData(suffix: 'K', data :30.0, fraction: 1);
```
---