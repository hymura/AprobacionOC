package co.com.ceiba.oc.dominio.servicio;

import java.util.List;

import co.com.ceiba.oc.dominio.model.ApprovalOrder;
import co.com.ceiba.oc.dominio.model.ApproverAmount;
import co.com.ceiba.oc.dominio.model.PurchaseOrder;
import co.com.ceiba.oc.dominio.repositorio.ApprovalOrderRepositoy;

public class ApprovalOrderServices {

	private static final String ENVIAR_PARA_PARA_APROBACION = "Enviar para para aprobacion";
	private final ApprovalOrderRepositoy approvalOrderRepository;
	private static final String STAUS_APPROVED="APROBAR";

	public ApprovalOrderServices(ApprovalOrderRepositoy approvalOrderRep) {
		this.approvalOrderRepository = approvalOrderRep;
	}

	/**
	 * Metodo para realizar la operacion de guardar una orden para aprobacion
	 * 
	 * @param cliente
	 * @return
	 */

	public ApprovalOrder create(ApprovalOrder approvalOrder) {
		return this.approvalOrderRepository.save(approvalOrder);
	}

	/**
	 * Metodo para realizar la operacion de actualizar una orden para aprobacion
	 * 
	 * @param cliente
	 * @return
	 */

	public ApprovalOrder update(ApprovalOrder approvalOrder) {
		return this.approvalOrderRepository.save(approvalOrder);
	}

	/**
	 * Definicion de metodo para buscar ordenes por id de aprobador
	 * 
	 * @param ApprovalId
	 * @return
	 */

	public ApprovalOrder findByApprovalId(int approvalId) {
		return approvalOrderRepository.findByApprovalId(approvalId);
	}

	/**
	 * Definicion de metodo para buscar todas las ordenes
	 * 
	 * @params
	 * @return
	 */
	public List<ApprovalOrder> findAll() {
		return approvalOrderRepository.findAll();
	}

	public ApprovalOrder generateApproval(ApprovalOrder approvalOrder, String action) {

		if (action.equals(STAUS_APPROVED)) {
			approvalOrder.approvePurchase();
		}else {
			approvalOrder.rejectPurchase();			
		}

		return this.approvalOrderRepository.update(approvalOrder);
	}

	public ApprovalOrder sendToapproval(PurchaseOrder purchaseOrder, ApproverAmount approverAmount) {
		
		ApprovalOrder approvalOrder=new	ApprovalOrder();
		approvalOrder.setApproverAmount(approverAmount);
		approvalOrder.setPurchaseOrder(purchaseOrder);
		approvalOrder.setAppovalAmount(approvalOrder.getPurchaseOrder().getTotalAmount());
		approvalOrder.setMotivo(ENVIAR_PARA_PARA_APROBACION);
		
		
		return this.approvalOrderRepository.save(approvalOrder);
	}




}
