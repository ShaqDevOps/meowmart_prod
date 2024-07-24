server {
    listen 80;
    server_name ${DOMAIN} www.${DOMAIN};

    location /static {
        alias /vol/static/;
    }

    location /media {
        alias /vol/media/;
    }

location /health {
        access_log off;
        return 200 'OK';
        add_header Content-Type text/plain;
    }

    location / {
        proxy_pass http://app:9000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 600;
        proxy_send_timeout 600;
        proxy_read_timeout 600;
        send_timeout 600;
        proxy_buffering off;
    }
}
