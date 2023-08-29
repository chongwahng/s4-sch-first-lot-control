using {API_PROCESS_ORDER_2_SRV} from './API_PROCESS_ORDER_2_SRV';

extend service API_PROCESS_ORDER_2_SRV with {
    @topic: 'sap.s4.beh.processorder.v1.ProcessOrder.Created.v1'
    event ProcessOrder.Created {
        ManufacturingOrder : API_PROCESS_ORDER_2_SRV.A_ProcessOrder_2:ManufacturingOrder
    }

    @topic: 'sap.s4.beh.processorder.v1.ProcessOrder.Changed.v1'
    event ProcessOrder.Changed {
        ManufacturingOrder : API_PROCESS_ORDER_2_SRV.A_ProcessOrder_2:ManufacturingOrder
    }
}
