/**
 * @description       : Traduz o que o OmniStudio manda (JSON/Map) para o que a FinancialService entenda
 * @author            : Kharylin Dias
 * @group             : FinForce Lending
 * @last modified on  : 01-09-2026
 * @last modified by  : Kharylin Dias
 **/
public with sharing class FinancialServiceAdapter implements System.Callable {
    
    // O OmniStudio vai chamar esse método genérico "call"
    public Object call(String action, Map<String, Object> args) {
        Map<String, Object> input = (Map<String, Object>) args.get('input');
        Map<String, Object> output = (Map<String, Object>) args.get('output');
        Map<String, Object> options = (Map<String, Object>) args.get('options');
        
        // Roteador de Ações (Switch case)
        switch on action {
            when 'calcularParcela' {
                return calcularParcela(input, output);
            }
            when else {
                throw new ExtensionMalformedCallException('Método não encontrado: ' + action);
            }
        }
    }
    
    // Método privado que desempacota o JSON e chama o FinancialService oficial
    private Boolean calcularParcela(Map<String, Object> input, Map<String, Object> output) {
        try {
            // 1. Desempacota os dados do JSON (Input do IP)
            Decimal valor = (Decimal) input.get('valorEmprestimo');
            Decimal taxa = (Decimal) input.get('taxaJurosAnual');
            Integer meses = Integer.valueOf(input.get('meses'));
            
            // 2. Chama o Motor Matemático (Sua classe de ontem)
            Decimal valorParcela = FinancialService.calcularParcela(valor, taxa, meses);
            
            // 3. Empacota a resposta de volta para o JSON
            output.put('valorParcelaMensal', valorParcela);
            output.put('status', 'Sucesso');
            
            return true; // Retorno true pro OmniStudio saber que deu certo
            
        } catch (Exception e) {
            output.put('erro', e.getMessage());
            return false;
        }
    }
    
    // Classe de exceção customizada necessária para o switch
    public class ExtensionMalformedCallException extends Exception {}
}