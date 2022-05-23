server {
        listen 80;
        listen [::]:80;

        root /var/www/lighthouse;
        index index.html;

        server_name lighthouse;

        location / {
                try_files $uri $uri/ =404;
        }
}