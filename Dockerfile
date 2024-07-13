FROM jenkins/jenkins:lts-jdk17

# root 사용자로 전환
USER root

# jenkins 빌드에이전트 환경 구성
RUN apt-get update && \
    apt-get install -y curl openjdk-17-jdk nodejs npm git

# ngrok 설치 (로컬 테스트 터널링 용도 / 배포 버전에선 주석)
RUN apt-get install gnupg
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && \
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && \
    apt-get update && \
    apt-get install -y ngrok

# 젠킨스 사용자로 전환
USER jenkins

# 추천 플러그인 몽땅 설치 - aws위에서 설치하면 오래걸리고 Ram이 터지는 불상사가 생길 수 있기 때문에 미리 설치하도록 구성
RUN jenkins-plugin-cli --plugins \
    github-pullrequest:0.7.0 \
    antisamy-markup-formatter \
    build-timeout \
    credentials-binding \
    timestamper \
    ws-cleanup \
    ant \
    gradle \
    github-branch-source \
    pipeline-github-lib \
    pipeline-graph-analysis \
    git \
    ssh-slaves \
    matrix-auth \
    pam-auth \
    ldap \
    email-ext \
    mailer \
    dark-theme

# 초기 설정 스크립트 복사
# COPY init.groovy.d/init.groovy /usr/share/jenkins/ref/init.groovy.d/
