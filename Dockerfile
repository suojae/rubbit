FROM node:18
WORKDIR /app

# 패키지 설치 및 빌드
COPY package.json package-lock.json ./
RUN npm install
COPY . .

# 포트 설정
EXPOSE 3000

# 애플리케이션 실행
CMD ["npm", "run", "start"]
