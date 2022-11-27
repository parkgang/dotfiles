## Overview

1. `키 맵핑` 혹은 `단축키 룰` 적용 이외 크게 건드리는 것은 없을 것 입니다.
1. 바로 사용할 수 있도록 기본 값 스키마를 구하기가 어려운데 이유는 연결된 `I/O` 에 따라서 스키마가 계속 변경되기 떄문입니다.

## 사용법

> `.config/karabiner` 에 배치하면 되는데 바로 사용할 수 있는 상태로 가공되어 있지 않기 때문에 아래의 논리에 의하여 사용하시면 됩니다.

1. `~/.config/karabiner/` 에 [assets](./assets) 를 배치합니다.
   1. 특수 하게 조합된 키 조합의 템플릿이 있으며 손쉽게 설정 및 비활성화 하기 위해서 사용됩니다.
1. 아래의 논리에 의하여 [karabiner.json](./karabiner.json) 는 변경되었으며 참고하여 `~/.config/karabiner/karabiner.json` 를 수정합니다.
   1. `devices` 에 따라 변경된 단축키
      1. `devices` 에는 변경된 단축키 맵핑 내용이 있습니다.
      1. 맵핑이 필요한 디바이스를 찾아서 해당 부분만 코드를 보고 `UI` 으로 고치던 `diff` 를 통해 바로 코드로 반영할 수 있을 것 입니다.
   1. 활성화 된 룰
      1. `profiles.complex_modifications.rules` 의 경우 활성화 한 것만 주석으로 작성해 놓았는데 모두 `assets/complex_modifications` 에 있는 설정들 입니다.
      1. 사실 활성화 하면 `assets/complex_modifications` 의 내용이 그대로 들어가는건데 불필요한 중복코드가 발생합니다.
      1. 사용되는 룰은 모두 `assets/complex_modifications` 에 배치한 것이므로 모두 활성화 하면 됩니다.
   1. `fn` 맵핑 내용
      1. `fn_function_keys` 의 경우 `UI` 상에서 비활성화 했기 때문에 맵핑된 코드가 불필요하여 모두 제거했습니다.
      1. 이전 값이 궁금하면 기본 값 내용 보면 됩니다.
      1. 나중에 맵핑할 일이 생기면 참고해서 가져오게 될 것 입니다.
   1. 이외 숫자 형식이 주로 있는 기본 값 설정 및 다른 프로필 들
      1. 건드린게 없습니다. `diff` 으로 확인하도록 합니다.

## default karabiner.json

`diff` 를 위해서 `devices` 이외 기본 값이 지정된 설정 파일입니다.

> 일부로 파일이 관리하지 않고 `README` 에 작성하였습니다. 파일로 빠지면 설정과 관련 있는 파일로 햇갈릴 수 있기 때문입니다.

```json
{
  "global": {
    "check_for_updates_on_startup": true,
    "show_in_menu_bar": true,
    "show_profile_name_in_menu_bar": false,
    "unsafe_ui": false
  },
  "profiles": [
    {
      "complex_modifications": {
        "parameters": {
          "basic.simultaneous_threshold_milliseconds": 50,
          "basic.to_delayed_action_delay_milliseconds": 500,
          "basic.to_if_alone_timeout_milliseconds": 1000,
          "basic.to_if_held_down_threshold_milliseconds": 500,
          "mouse_motion_to_scroll.speed": 100
        },
        "rules": []
      },
      "devices": [
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": true,
            "is_pointing_device": false,
            "product_id": 832,
            "vendor_id": 1452
          },
          "ignore": false,
          "manipulate_caps_lock_led": true,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        },
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": false,
            "is_pointing_device": true,
            "product_id": 832,
            "vendor_id": 1452
          },
          "ignore": true,
          "manipulate_caps_lock_led": false,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        },
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": true,
            "is_pointing_device": true,
            "product_id": 45083,
            "vendor_id": 1133
          },
          "ignore": true,
          "manipulate_caps_lock_led": true,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        },
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": false,
            "is_pointing_device": true,
            "product_id": 613,
            "vendor_id": 76
          },
          "ignore": true,
          "manipulate_caps_lock_led": false,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        },
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": true,
            "is_pointing_device": false,
            "product_id": 34304,
            "vendor_id": 1452
          },
          "ignore": false,
          "manipulate_caps_lock_led": true,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        },
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": true,
            "is_pointing_device": false,
            "product_id": 40962,
            "vendor_id": 1241
          },
          "ignore": false,
          "manipulate_caps_lock_led": true,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        },
        {
          "disable_built_in_keyboard_if_exists": false,
          "fn_function_keys": [],
          "identifiers": {
            "is_keyboard": false,
            "is_pointing_device": true,
            "product_id": 40962,
            "vendor_id": 1241
          },
          "ignore": true,
          "manipulate_caps_lock_led": false,
          "simple_modifications": [],
          "treat_as_built_in_keyboard": false
        }
      ],
      "fn_function_keys": [
        {
          "from": {
            "key_code": "f1"
          },
          "to": [
            {
              "consumer_key_code": "display_brightness_decrement"
            }
          ]
        },
        {
          "from": {
            "key_code": "f2"
          },
          "to": [
            {
              "consumer_key_code": "display_brightness_increment"
            }
          ]
        },
        {
          "from": {
            "key_code": "f3"
          },
          "to": [
            {
              "apple_vendor_keyboard_key_code": "mission_control"
            }
          ]
        },
        {
          "from": {
            "key_code": "f4"
          },
          "to": [
            {
              "apple_vendor_keyboard_key_code": "spotlight"
            }
          ]
        },
        {
          "from": {
            "key_code": "f5"
          },
          "to": [
            {
              "consumer_key_code": "dictation"
            }
          ]
        },
        {
          "from": {
            "key_code": "f6"
          },
          "to": [
            {
              "key_code": "f6"
            }
          ]
        },
        {
          "from": {
            "key_code": "f7"
          },
          "to": [
            {
              "consumer_key_code": "rewind"
            }
          ]
        },
        {
          "from": {
            "key_code": "f8"
          },
          "to": [
            {
              "consumer_key_code": "play_or_pause"
            }
          ]
        },
        {
          "from": {
            "key_code": "f9"
          },
          "to": [
            {
              "consumer_key_code": "fast_forward"
            }
          ]
        },
        {
          "from": {
            "key_code": "f10"
          },
          "to": [
            {
              "consumer_key_code": "mute"
            }
          ]
        },
        {
          "from": {
            "key_code": "f11"
          },
          "to": [
            {
              "consumer_key_code": "volume_decrement"
            }
          ]
        },
        {
          "from": {
            "key_code": "f12"
          },
          "to": [
            {
              "consumer_key_code": "volume_increment"
            }
          ]
        }
      ],
      "name": "Default profile",
      "parameters": {
        "delay_milliseconds_before_open_device": 1000
      },
      "selected": true,
      "simple_modifications": [],
      "virtual_hid_keyboard": {
        "country_code": 0,
        "indicate_sticky_modifier_keys_state": true,
        "mouse_key_xy_scale": 100
      }
    }
  ]
}
```
