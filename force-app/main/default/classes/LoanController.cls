/**
 * @description       :
 * @author            : Kharylin Dias
 * @group             :
 * @last modified on  : 01-13-2026
 * @last modified by  : Kharylin Dias
 **/
public with sharing class LoanController {
    @AuraEnabled
    public static Map<String, Object> simular(Map<String, Object> dadosDaTela){
        
        String ipName = 'FinForce_SimularEmprestimo'; // integration procedure
        
        Map<String, Object> ipOptions = new Map<String, Object>(); // mapa de opções obrigatório no método
        
        try {
            Map<String, Object> result = (Map<String, Object>) vlocity_cmt.IntegrationProcedureService.runIntegrationService(ipName, dadosDaTela, ipOptions);
            
            return result;
            
        } catch(Exception e) {
            System.debug('Erro ao executar IP: ' + e.getMessage());
            
            // Erro tratado para o front-end
            throw new AuraHandledException(
                'Não foi possível simular o empréstimo. Tente novamente mais tarde.' + e.getMessage());
        }
        
    }
}