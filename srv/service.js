module.exports = async function (srv) {
    const cds = require('@sap/cds')

    if (process.env.S4HANA_DESTNAME) {
        console.log(`user provided variable: S4HANA_DESTNAME = ${process.env.S4HANA_DESTNAME}`)
        if (cds.env.requires.API_BILL_OF_MATERIAL_SRV.credentials?.destination) {
            cds.env.requires.API_BILL_OF_MATERIAL_SRV.credentials.destination = process.env.S4HANA_DESTNAME
        }
        if (cds.env.requires.API_CHANGEMASTER.credentials?.destination) {
            cds.env.requires.API_CHANGEMASTER.credentials.destination = process.env.S4HANA_DESTNAME
        }
        if (cds.env.requires.API_PROCESS_ORDER_2_SRV.credentials?.destination) {
            cds.env.requires.API_PROCESS_ORDER_2_SRV.credentials.destination = process.env.S4HANA_DESTNAME
        }
    }

    const bomSrv = await cds.connect.to('API_BILL_OF_MATERIAL_SRV')
    const chmSrv = await cds.connect.to('API_CHANGEMASTER')
    const proSrv = await cds.connect.to('API_PROCESS_ORDER_2_SRV')

    this.on('READ', 'BillOfMaterialExternals', async (req) => {
        return bomSrv.run(req.query)
    })

    this.on('READ', 'ChangeMasterExternals', async (req) => {
        return chmSrv.run(req.query)
    })

    this.on('READ', 'ProcessOrderExternals', async (req) => {
        return proSrv.run(req.query)
    })

    bomSrv.on('BillOfMaterial.Created', async msg => {
        console.log(msg)
    })

    bomSrv.on('BillOfMaterial.Changed', async msg => {
        console.log(msg)
        const query = SELECT("*").from("API_CHANGEMASTER.A_ChangeMaster").where(`ChangeNumber = '${msg.data.EngineeringChangeDocument}'`)
        const result = await chmSrv.run(query)

        console.log(result)

        if (result.ReasonForChangeText === 'FLC') {
            let path =
                `/MaterialBOM` +
                `(` +
                `BillOfMaterial='${msg.data.BillOfMaterial}',` +
                `BillOfMaterialCategory='${msg.data.BillOfMaterialCategory}',` +
                `BillOfMaterialVariant='${msg.data.BillOfMaterialVariant}',` +
                `BillOfMaterialVersion='${msg.data.BillOfMaterialVersion}',` +
                `EngineeringChangeDocument='${msg.data.EngineeringChangeDocument}',` +
                `Material='${msg.data.Material}',` +
                `Plant='${msg.data.Plant}'` +
                `)`

            try {
                bomSrv.send({
                    method: 'PATCH',
                    path: path,
                    headers: {
                        'If-Match': '*'
                    },
                    data: {
                        BillOfMaterialStatus: '12'
                    }
                })
            } catch (err) {
                if (err.code) {
                    console.log(err.code)
                }
                if (err.errno) {
                    console.log(err.errno)
                }
                if (err.stack) {
                    console.log(err.stack)
                }
                if (err.message) {
                    console.log(err.message)
                }
            }
        }
    })

    this.on('UpdateBOMStatus', async (req) => {
        let bom = req.data.data
        let path = `/MaterialBOM(` +
            `BillOfMaterial='${bom.BillOfMaterial}',` +
            `BillOfMaterialCategory='${bom.BillOfMaterialCategory}',` +
            `BillOfMaterialVariant='${bom.BillOfMaterialVariant}',` +
            `BillOfMaterialVersion='${bom.BillOfMaterialVersion}',` +
            `EngineeringChangeDocument='${bom.EngineeringChangeDocument}',` +
            `Material='${bom.Material}',` +
            `Plant='${bom.Plant}'` +
            `)`
        console.log(path)
        try {
            bomSrv.send({
                method: 'PATCH',
                path: path,
                headers: {
                    "If-Match": '*'
                },
                data: {
                    BillOfMaterialStatus: `${bom.BillOfMaterialStatus}`
                }
            })
        }
        catch (err) {
            if (err.code) {
                console.log(err.code)
            }
            if (err.errno) {
                console.log(err.errno)
            }
            if (err.stack) {
                console.log(err.stack)
            }
            if (err.message) {
                console.log(err.message)
            }
        }
    })

    chmSrv.on('ChangeMaster.Created', async msg => {
        console.log(msg)
    })

    chmSrv.on('ChangeMaster.Changed', async msg => {
        console.log(msg)
    })

    proSrv.on('ProcessOrder.Created', async msg => {
        console.log(msg)
    })

    proSrv.on('ProcessOrder.Changed', async msg => {
        console.log(msg.data)
    })
}