# 使用官方的 Node 映像
FROM node:18 as builder

# 設置工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json
COPY package*.json ./

# 安裝依賴
RUN npm install

# 複製應用程式源碼
COPY . .

# 構建 React 應用
RUN npm run build


FROM node:18
#FROM --platform=linux/amd64 node:18

WORKDIR /build

COPY --from=builder /app/build .

RUN npm i -g serve

EXPOSE 3000

ENTRYPOINT ["serve", "-s"]
