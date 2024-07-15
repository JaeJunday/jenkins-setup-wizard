# jenkins-quick-template

젠킨스의 빠른 로컬 테스트와 설정 구성을 위한 템플릿

## 자동 구성 범위
![jenkins diagram](https://github.com/user-attachments/assets/ca8b780f-473f-4254-a722-4a6da3a24309)

## 사용법

### ssl/tls 자체 인증서 발급 
```shell
chmod +x init_tls.sh
bash init_tls.sh
```

### 도커 컴포즈 실행
```shell
docker compose up # compose.yaml
```

### 로컬 브라우저 접속
```shell
https://localhost:443
```

## 디렉토리 구조

```
.
├── Dockerfile
├── README.md
├── compose.aws.yaml
├── config
│   ├── init.groovy.d
│   │   └── init.groovy
│   └── plugins.txt
├── init_tls.sh
└── nginx
    ├── conf.d
    │   └── jenkins.conf
    ├── nginx.conf
    └── ssl
        ├── cert.key
        ├── cert.pem
        └── nginx.pem
```

### config/

  - 컨테이너가 시작할 때 젠킨스가 사용할 설정파일들을 넣어둡니다.
  - 주요 credentials / token 값이 git에 포함되지 않도록 주의해야 합니다.

### jenkins_home/

  - 컨테이너 런타임에 jenkins log, jop, plugin 등 /var/jenkins_home/에 마운트되는 디렉토리입니다.

### init_tls.sh

  - openssl을 활용하여 자체 인증서를 구성하는 스크립트 입니다.
  생성 디렉토리는 ./nginx/ssl/ 입니다.
  - 자체 도메인을 보유하고 있는 경우에는 let's encrypt 와 certbot을 활용하시는 것을 권장합니다.
