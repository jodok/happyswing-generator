FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
COPY data/nodered/package.json .
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

ENV TZ=Europe/Vienna

# Copy _your_ Node-RED project files into place
# NOTE: This will only work if you DO NOT later mount /data as an external volume.
#       If you need to use an external volume for persistence then
#       copy your settings and flows files to that volume instead.
COPY data/nodered/settings.js /data/settings.js
COPY data/nodered/flows_cred.json /data/flows_cred.json
COPY data/nodered/flows.json /data/flows.json
