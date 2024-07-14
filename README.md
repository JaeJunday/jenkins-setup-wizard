# jenkins-quick-template

젠킨스의 빠른 로컬 테스트와 설정 구성을 위한 템플릿

## 사용법

- config/

  - 컨테이너가 시작할 때 젠킨스가 사용할 설정파일들을 넣어둡니다.
  - 주요 credentials / token 값이 git에 포함되지 않도록 주의해야 합니다.

- jenkins_home/

  - jenkins log, jop, plugin 등 젠킨스 런타임에 마운트하는 디렉토리입니다.
