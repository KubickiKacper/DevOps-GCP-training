FROM python:3.9

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		default-mysql-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY . .
RUN pip install -r requirements.txt
WORKDIR /usr/src/app/devops_gcp_training

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]