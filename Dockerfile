FROM mailhog/mailhog

ENV MAILHOG_BASIC_AUTH_USER="admin"
ENV MAILHOG_BASIC_AUTH_PASSWORD="password"

USER root

RUN mkdir /home/mailhog/auth

RUN echo "$MAILHOG_BASIC_AUTH_USER:$(/usr/local/bin/MailHog bcrypt $MAILHOG_BASIC_AUTH_PASSWORD)" > /home/mailhog/auth/auth.file 

USER mailhog 

WORKDIR /home/mailhog

ENTRYPOINT ["MailHog", "-auth-file=/home/mailhog/auth/auth.file"]
