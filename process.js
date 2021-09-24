'use strict';

const data = require('./results.json');

console.log(data.serverResponse.result.map((d) => {return {serial: d.serialNum, firmware: d.firmwareVersion, config: d.configVersion}; }));