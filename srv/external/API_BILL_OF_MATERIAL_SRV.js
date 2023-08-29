const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
    this.after('INSERT', data => {
        const { BillOfMaterial } = data
        return this.emit('Created', { BillOfMaterial })
    })
})