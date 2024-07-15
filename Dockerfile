FROM jenkins/jenkins:lts-jdk17

# root 사용자로 전환
USER root

# jenkins 빌드에이전트 환경 구성
RUN apt-get update && \
    apt-get install -y curl nodejs npm git

# 젠킨스 사용자로 전환
USER jenkins

# 추천 플러그인 몽땅 설치 - aws위에서 설치하면 오래걸리기 때문에 레이어에 포함하도록 구성
COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# 초기 설정 스크립트 복사
# COPY config/init.groovy.d/init.groovy /usr/share/jenkins/ref/init.groovy.d/
