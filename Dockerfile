FROM openjdk:8

LABEL name="SAPWebIDE"
LABEL description="Docker image for SAP Web IDE Personal Edition" 
LABEL version="0.0.1"
LABEL maintainer="sarathm09"

RUN mkdir /webide
WORKDIR /webide

RUN wget https://ftp.jaist.ac.jp/pub/eclipse/orion/drops/R-10.0-201510301610/eclipse-orion-10.0-linux.gtk.x86_64.zip && \
    wget --header "Cookie: eula_3_1_agreed=tools.hana.ondemand.com/developer-license-3_1.txt" https://tools.hana.ondemand.com/additional/sap-webide-personal-edition-1.53.9-trial-win32.win32.x86.zip

RUN unzip eclipse-orion-10.0-linux.gtk.x86_64.zip -d orion && \
    unzip sap-webide-personal-edition-1.53.9-trial-win32.win32.x86.zip -d webide

RUN rm -rf webide/eclipse/orion.exe webide/eclipse/orion.ini && \
    cp -r orion/eclipse/plugins webide/eclipse && \
    cp orion/eclipse/orion webide/eclipse/orion && \
    rm -rf orion sap-webide-personal-edition-1.53.9-trial-win32.win32.x86.zip eclipse-orion-10.0-linux.gtk.x86_64.zip && \
    echo -e "-startup\nplugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar\n--launcher.library\nplugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.1.200.v20140603-1326\n-consoleLog\n-console\n-data\nserverworkspace\n-nosplash\n-vmargs\n-Dorg.eclipse.equinox.http.jetty.http.port=8080\n-Dorg.eclipse.equinox.http.jetty.http.host=0.0.0.0\n-Dorg.eclipse.equinox.http.jetty.autostart=false\n-Dorion.XSRFPreventionFilterEnabled=true\n-Dhelp.lucene.tokenizer=standard\n-Xms40m\n-Xmx384m" > webide/eclipse/orion.ini

EXPOSE 8080/tcp

CMD [ "webide/eclipse/orion"]




