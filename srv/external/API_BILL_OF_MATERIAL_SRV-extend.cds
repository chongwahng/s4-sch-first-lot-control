using {API_BILL_OF_MATERIAL_SRV} from './API_BILL_OF_MATERIAL_SRV';

extend service API_BILL_OF_MATERIAL_SRV with {
    @topic: 'sap.s4.beh.billofmaterial.v1.BillOfMaterial.Created.v1'
    event BillOfMaterial.Created {
        BillOfMaterial            : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterial;
        BillOfMaterialCategory    : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialCategory;
        BillOfMaterialHeaderUUID  : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialHeaderUUID;
        BillOfMaterialVariant     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialVariant;
        BillOfMaterialVersion     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialVersion;
        EngineeringChangeDocument : API_BILL_OF_MATERIAL_SRV.MaterialBOM:EngineeringChangeDocument;
        Material                  : API_BILL_OF_MATERIAL_SRV.MaterialBOM:Material;
        Plant                     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:Plant;
    }

    @topic: 'sap.s4.beh.billofmaterial.v1.BillOfMaterial.Changed.v1'
    event BillOfMaterial.Changed {
        BillOfMaterial            : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterial;
        BillOfMaterialCategory    : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialCategory;
        BillOfMaterialHeaderUUID  : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialHeaderUUID;
        BillOfMaterialVariant     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialVariant;
        BillOfMaterialVersion     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialVersion;
        EngineeringChangeDocument : API_BILL_OF_MATERIAL_SRV.MaterialBOM:EngineeringChangeDocument;
        Material                  : API_BILL_OF_MATERIAL_SRV.MaterialBOM:Material;
        Plant                     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:Plant;
    }
}
