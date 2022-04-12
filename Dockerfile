FROM benchao/arpt:v2.0.8
RUN sudo mkdir /onedrive
RUN sudo mkdir /upload
ENV Api_hash=655e892751199296414dbd56492cffe9
ENV Api_id=9410584
ENV Remote=onedrive
ENV Telegram_bot_api=5147598715:AAGGtX3Oj-IXUeh_3m628Qv2-0q8Vx5BVXs
ENV Telegram_user_id=5028789339
ENV Upload=/upload
ENV Rclone_share=False
ENV Error_user_info="Wrong user"
EXPOSE 8868/tcp
EXPOSE 8868/udp
EXPOSE 8868
ADD /rclone.conf /.config/rclone/rclone.conf
ADD /rclone.conf /root/.config/rclone/rclone.conf
RUN rclone mount onedrive: /onedrive --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --vfs-cache-mode full
CMD ["bash","start.sh"]
