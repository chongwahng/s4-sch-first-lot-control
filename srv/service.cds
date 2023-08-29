using {db} from '../db/data-model';
using {API_BILL_OF_MATERIAL_SRV} from './external/API_BILL_OF_MATERIAL_SRV';

service FirstLotControlService {
    @readonly
    entity BillOfMaterialExternals as projection on db.BillOfMaterialExternals;

    @readonly
    entity ChangeMasterExternals   as projection on db.ChangeMasterExternals;

    @readonly
    entity ProcessOrderExternals   as projection on db.ProcessOrderExternals;

    type BOM {
        BillOfMaterial            : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterial;
        BillOfMaterialCategory    : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialCategory;
        BillOfMaterialHeaderUUID  : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialHeaderUUID;
        BillOfMaterialVariant     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialVariant;
        BillOfMaterialVersion     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialVersion;
        EngineeringChangeDocument : API_BILL_OF_MATERIAL_SRV.MaterialBOM:EngineeringChangeDocument;
        Material                  : API_BILL_OF_MATERIAL_SRV.MaterialBOM:Material;
        Plant                     : API_BILL_OF_MATERIAL_SRV.MaterialBOM:Plant;
        BillOfMaterialStatus      : API_BILL_OF_MATERIAL_SRV.MaterialBOM:BillOfMaterialStatus;
    }

    action UpdateBOMStatus(data : BOM) returns String;
}
