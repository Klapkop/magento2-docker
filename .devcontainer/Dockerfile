FROM ghcr.io/klapkop/magento2-docker/magento2:main

RUN apk add zsh oh-my-zsh vim nano

RUN adduser app -u 1000 -D -s /bin/zsh -G www-data && \
    echo "app ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/app && \
    addgroup app wheel

RUN rm -rf /var/www/html && ln -s /workspace/src /var/www/html

#USER app
#RUN curl -L git.io/antigen > /home/app/antigen.zsh 
RUN cp /usr/share/oh-my-zsh/templates/zshrc.zsh-template /home/app/.zshrc && chown -R app:www-data /home/app
USER root