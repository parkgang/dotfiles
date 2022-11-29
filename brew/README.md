## Overview

1. 원래는 한개의 `Brewfile` 를 가지고 `OS` 변수로 구분해서 `mac` 환경과 `linux` 모두 가능하도록 하려고 했지만 설치 및 삭제마다 `brew bundle -f dump` 으로 손쉽게 생성도 못하고 `diff` 도 어려워서 그냥 `OS` 환경별로 `Brewfile` 를 생성하는 전략을 택했습니다.
1. 공통적으로 사용되는 패키지는 각 환경에 맞게 공통으로 들어갑니다. 다른 점은 환경별로 `diff` 를 통해 확인합니다.

## 사용법

> 각 `OS` 에 맞는 디렉터리로 이동하여 수행하면 됩니다.

```shell
brew cleanup && brew bundle -f dump
brew bundle
```
