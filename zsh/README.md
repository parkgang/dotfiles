## Overview

1. 기본적으로 `oh-my-zsh` 을 사용하는 것을 **`전재`** 로 하기 떄문에 `.zshrc` 는 `oh-my-zsh` 에 의존적 입니다.
   1. 제가 수정된 `.zshrc` 부분만 궁금하면 [zshrc.zsh-template](https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template) 파일과 `diff` 를 하면 알아낼 수 있습니다.
1. `p10k` theme를 사용하고 있는데 테마 설정도 `code` 로써 분리되길래 형상관리로 가능할 거 같아 추가는 해 놓았습니다.
   1. 그럼에도 코드보다 `p10k 마법사` 로 설정하는 것이 더 쉽고 직관적이며 형상관리 되는 파일은 내가 이전에 설정한 `theme` 와 달라진 것이 있는지 없는지를 확인하기 위한 용도로 사용하도록 합니다.

## 사용법

해당 디렉터리 파일을 모두 `~` 에 배치하면 됩니다.

단, 아래의 내용을 주의해주세요.

1. `clean install start` 를 지향하기 때문에 우선 `clean` 상태로 모두 설정을 마친 후 해당 리포에서 관리되는 설정 파일을 비교하면서 가져오도록 합니다.
   1. `clean` 하게 설정을 위한 방법은 `notion` 에서 관리되고 있습니다.
   1. `theme` 및 서드파티 플러그인도 마찬가지 입니다.
1. `WSL` 관련으로
   1. `.zprofile` 의 경우 파일 내용을 보면 `linux` 환경에서 `brew` 를 사용하기 위해서 존재하는 파일인데 `WSL` 기준으로 작성되어 `WSL` 환경 이외 필요한 파일은 아닙니다.
      1. `macOS` 환경의 경우 배치하지 않도록 합니다.
   1. 로케일 이슈로 `powerlevel10k prompt styles` 문제 발생하여 `export LANG="en_US.UTF-8"` 를 설정하는 부분이 있는데 이는 굳이 `macOS` 에서는 문제가 발생하지 않음으로 굳이 설정할 필요가 없습니다.
      1. `macOS` 환경의 경우 한국 로케일로 설정하는 것이 `powerlevel10k` 에서 한국 시간으로 나오므로 굳이 해당 설정은 가져오지 않아도 됩니다.

## clean하게 다시 시작하고 싶다면?

1. [oh-my-zsh 삭제 문서](https://github.com/ohmyzsh/ohmyzsh#uninstalling-oh-my-zsh) 를 참고하여 `uninstall_oh_my_zsh` 로 `oh-my-zsh` 를 삭제하고 다시 시작하면 됩니다.
   1. `theme` 및 `plugin` 도 `oh-my-zsh` 설치 디렉터리인 `~/.oh-my-zsh` 으로 모두 들어가기`oh-my-zsh` 를 제거하면 깔끔하게 설정을 시작할 수 있습니다.
