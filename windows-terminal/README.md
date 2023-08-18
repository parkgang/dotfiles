## Overview

1. `VSCode` 처럼 변경한 설정만 깔끔하게 노출되지 않고 건드리지 않아도 기본으로 노출되는 설정이 있어서 파일로 관리하기 찝찝합니다.
1. 그래도 방법으로 `settings.json` 내용을 모두 날리고 저장하면 기본 값으로 돌아온다고 합니다.
   > https://www.thewindowsclub.com/reset-windows-terminal-settings-to-default
1. 제가 수정한 부분이 궁금하면 `Windows Terminal` 의 `settings.json` 을 모두 제거 후 저장해서 나온 데이터와 해당 repo에서 관리되는 설정 값을 `diff` 하면 됩니다.
   > 아마 `profiles.defaults` 부분과 `theme` 관련만 중점으로 변경됐을 것입니다.

## 사용법

1. `Windows Terminal` 을 실행해서 `Ctrl + ,` 으로 설정에 들어가서 `Json` 파일을 열고 `settings.json` 을 붙어넣습니다.
1. 그러면 다르게 `diff` 되는 것들이 나올텐데 거기서 
   - 새롭게 반영된 `필드` 들은 `dotfiles` 에 반영하고
   - 옵션이 확장되어 필요한 것들은 복사해서 `Windows Terminal` 에 반영합니다.
   - 이것들은 매뉴얼화 하기 어려우며 상황에 맞게 반영하면 됩니다.

