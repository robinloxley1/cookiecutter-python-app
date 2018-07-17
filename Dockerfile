FROM IMAGE
MAINTAINER NAME EMAIL

RUN addgroup -g 1000 -S username && \
    adduser -u 1000 -S username -G username

USER username
WORKDIR
ADD app.zip .
RUN unzip app.zip && rm -f app.zip
RUN pip install -r requirements.txt --user \
    && python setup.py install --user
ENTRYPOINT ["python", "-m", "{{cookiecutter.app_name}}"]
CMD ["--help"]
