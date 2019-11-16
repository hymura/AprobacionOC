package co.com.ceiba.oc.aplicacion.manejador.approver;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import co.com.ceiba.oc.aplicacion.servicio.AppoverAmountServices;
import co.com.ceiba.oc.dominio.model.ApproverAmount;

@Component
public class CreateApproverHandler {
	private final  AppoverAmountServices appoverAmountServices;
    @Autowired
	public CreateApproverHandler(AppoverAmountServices appoverAmountServices) {	
		this.appoverAmountServices = appoverAmountServices;
	}
	
	
	@Transactional(readOnly = true)
	public ApproverAmount execute(ApproverAmount approverAmount) {		
		return appoverAmountServices.create(approverAmount);				
	}

	
	

}
