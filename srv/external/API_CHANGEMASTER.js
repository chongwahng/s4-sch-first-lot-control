const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
    this.after('INSERT', data => {
        const { ChangeNumber } = data
        return this.emit('Created', { ChangeNumber })
    })
})