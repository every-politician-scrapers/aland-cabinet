// wd create-entity create-office.js "Minister for X"

const fs = require('fs');
let rawmeta = fs.readFileSync('meta.json');
let meta = JSON.parse(rawmeta);

module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      sv: label,
    },
    descriptions: {
      en: 'government position in Åland',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P1001: { value: 'Q5689'    }, // jurisdiction: Åland
      P361: {
        value: 'Q2625260',         // part of: Government of Åland
        references: {
          P854: meta.source.url,
        },
      }
    }
  }
}
