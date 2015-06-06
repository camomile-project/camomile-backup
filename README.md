camomile-backup
===============

Backup Camomile MongoDB to FTP server as a cron task

### Usage

Attach a mongo container to this container. 

	docker run -d \
		-e CRON_SCHEDULE="0 12 * * *"     # cron job schedule
		-e FTP_SERVER=ftp.backup.com      # FTP server
		-e FTP_USER=login                 # FTP login
		-e FTP_PASSWORD=p4s5w0rd          # FTP password
		--link my-mongo-container:mongo	  # linked container with running mongo
		camomile/backup
