# Nadar

A brick to create a feature using best practices with provider state management.

## How to use 🚀

```
mason make nadar --feature_name login
```

## Variables ✨

| Variable           | Description                     | Default     | Type      | Conditional | When             |
| ------------------ | ------------------------------- |-------------| --------- | ----------- | ---------------- |
| `feature_name`     | The name of the feature         | new_feature | `string`  | false       | N/A              |

## Outputs 📦

```
├── data
│ ├── data_source
│ │ └── login_data_source.dart
│ └── model
│     └── login_model.dart
└── presentation
    ├── mixin
    │ └── login_mixin.dart
    ├── view
    │ └── login_view.dart
    ├── view_model
    │ └── login_view_model.dart
    └── widget        
        └── email_input.dart
```