# SSL cert fingerprint
openssl s_client -connect imap.gmail.com:993 | openssl x509 -noout -fingerprint
