using {API_CHANGEMASTER} from './API_CHANGEMASTER';

extend service API_CHANGEMASTER with {
    @topic: 'sap.s4.beh.changemaster.v1.ChangeMaster.Created.v1'
    event ChangeMaster.Created {
        ChangeNumber : API_CHANGEMASTER.A_ChangeMaster:ChangeNumber
    }

    @topic: 'sap.s4.beh.changemaster.v1.ChangeMaster.Changed.v1'
    event ChangeMaster.Changed {
        ChangeNumber : API_CHANGEMASTER.A_ChangeMaster:ChangeNumber
    }
}
