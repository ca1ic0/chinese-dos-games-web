# 使用官方 Python 运行时作为父镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 将当前目录内容复制到位于 /app 的容器中
COPY . /app

# 安装 requirements.txt 中指定的任何所需包
RUN pip install --no-cache-dir -r requirements.txt

# 使端口 5000 可供此容器外的环境使用
EXPOSE 5000

# 定义环境变量
ENV FLASK_APP=app.py

# 在容器启动时运行 app.py
# 使用 gunicorn 运行生产级服务器
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
