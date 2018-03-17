#!/bin/bash

docker stop alfresco
docker rm alfresco
docker run -d \
-e INITIAL_PASS=secret \
-e ALF_2=email.inbound.enabled=false \
-e ALF_3=email.server.enabled=true \
-e ALF_4=email.server.port=25 \
-e ALF_5=email.server.domain=server.tld \
-e ALF_6=email.server.allowed.senders=.* \
-e ALF_7=mail.host=172.17.0.1 \
-e ALF_8=mail.port=25 \
-e ALF_9=mail.protocol=smtp \
-e ALF_10=mail.from.default=user@server.tld \
-e ALF_11=mail.testmessage.send=true \
-e ALF_12=mail.testmessage.to=admin@server.tld \
-e ALF_13="mail.testmessage.subject=Outbound SMTP" \
-e ALF_14="mail.testmessage.text=The Outbound SMTP email subsystem is working." \
-e ALF_15="alfresco.context=alfresco" \
-e ALF_16="alfresco.host=server.tld" \
-e ALF_17="alfresco.port=443" \
-e ALF_18="alfresco.ssl.port=443" \
-e ALF_19="alfresco.protocol=https" \
-e ALF_20="share.context=share" \
-e ALF_21="share.host=server.tld" \
-e ALF_22="share.port=443" \
-e ALF_23="share.ssl.port=443" \
-e ALF_24="share.protocol=https" \
--volumes-from alf-volumes \
-t -i \
-p 8083:8080 \
-p 8025:25 \
--name alfresco \
exception/alfresco
