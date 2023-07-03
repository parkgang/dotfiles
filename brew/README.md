## Overview

> 모든 것을 `brew` 으로 처리할 수 없는 부분이 존재하기 때문에 여기에 나열된 것이 설치된 것의 끝이라고 생각하지 않도록 합니다.

1. 원래는 한개의 `Brewfile` 를 가지고 `OS` 변수로 구분해서 `mac` 환경과 `linux` 모두 가능하도록 하려고 했지만 설치 및 삭제마다 `brew bundle -f dump` 으로 손쉽게 생성도 못하고 `diff` 도 어려워서 그냥 `OS` 환경별로 `Brewfile` 를 생성하는 전략을 택했습니다.
1. 공통적으로 사용되는 패키지는 각 환경에 맞게 공통으로 들어갑니다. 다른 점은 환경별로 `diff` 를 통해 확인합니다.
1. 원래는 `brew bundle -f dump` 으로만 처리했는데 내가 의도적으로 설치한 것 이외 불필요한 것들이 너무 늘어나서 따로 `brew leaves` 를 통해 내가 의도적으로 설치한 것만 추가적으로 추출하도록 하였습니다.
1. 복구 시 상황에 맞게 `Brewleaves` 와 `Brewfile` 를 사용하면 되는데
   1. `Brewleaves` 는 내가 의도적으로 설치한 것만 볼 수 있음으로 클린 설치 시 하나씩 보면서 매뉴얼대로 처리하게 좋을 것 입니다.
   1. `Brewfile` 은 `brew bundle` 을 통해 손쉽게 이전에 설치된 `버전` 및 `옵션` 등을 복구할 수 있습니다.
   1. 단순하게 내가 뭐가 설치되었는지 보고 싶고 하나하나 따로 설치하고 싶다면 `Brewleaves` 를 사용하겠지만 어짜피 `Brewleaves` 으로 설치하더라도 결과는 `Brewfile` 로 나올 거 같기 때문에 `Brewfile` 를 중점으로 사용하게 될 거 같습니다.

## 사용법

> 각 `OS` 에 맞는 디렉터리로 이동하여 수행하면 됩니다.

### 업그레이드

```shell
brew update # homebrew 최신 버전으로 update
brew upgrade # 패키지 전체 업그레이드
```

### 설치된 목록 (e.g. dump) 만들기

```shell
# 설치하거나 업데이트하는 과정에서 생성된 불필요한 파일들을 삭제
brew cleanup

# step1: 실제로 내가 설치한 것만: 어떤 것을 설치했는지 명시적으로 알기 위함
brew leaves > Brewleaves.txt

# step2: 설치된 모든 의존성: 버전 및 옵션 등 dump 수행하는 시스템에 맞게 구하기 위함
brew bundle -f dump
```

### dump 적용

상황에 맞게 `Brewleaves` 와 `Brewfile` 을 사용하면 됩니다.

```shell
# opt1: 설치된 것만 딱 설치하고 싶을 때 사용될 것
xargs brew install < Brewleaves.txt

# opt2: 옵션 및 실제 사용하던 환경대로 복구하기 위해서 사용될 것
brew bundle
```
