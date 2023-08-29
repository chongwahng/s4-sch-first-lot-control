namespace db;

using {API_BILL_OF_MATERIAL_SRV as bom} from '../srv/external/API_BILL_OF_MATERIAL_SRV';
using {API_CHANGEMASTER as chm} from '../srv/external/API_CHANGEMASTER';
using {API_PROCESS_ORDER_2_SRV as pso} from '../srv/external/API_PROCESS_ORDER_2_SRV';


entity BillOfMaterialExternals as projection on bom.MaterialBOM {
    key BillOfMaterial               as ID,
        IsMarkedForDeletion          as DeletionFlag,
        BillOfMaterialStatus         as Status,
        BillOfMaterialHdrDetailsText as HeaderText,
        BOMAlternativeText           as AlternativeText
}

entity ChangeMasterExternals   as projection on chm.A_ChangeMaster {
    key ChangeNumber            as ID,
        ReasonForChangeText     as ReasonText,
        ChangeNumberStatus      as Status,
        ChangeNumberDescription as Description,        
}

entity ProcessOrderExternals   as projection on pso.A_ProcessOrder_2 {
    key ManufacturingOrder as ID
}
