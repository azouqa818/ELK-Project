    # To edit logrotate configraition file, navitage to /etc/logrotate.conf
    # The template below configures a log rotation scheme that backs up authentication messages to the `/var/log/auth.log` directory #using the following settings:
    #Rotates weekly.
    #Rotates only the seven most recent logs.
    #Does not rotate empty logs.
    #Delays compression.
    #Skips error messages for missing logs and continues to next log.

    ```bash
    /var/log/auth.log {
      weekly
      rotate 7
      notifempty
      delaycompression
      missingok
    }
    ```