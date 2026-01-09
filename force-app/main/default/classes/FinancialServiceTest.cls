/**
 * @description       : Cobertura de teste
 * @author            : Kharylin Dias
 * @group             : FinForce Lending
 * @last modified on  : 01-09-2026
 * @last modified by  : Kharylin Dias
 **/
@isTest
private class FinancialServiceTest {
    
    @isTest
    static void deveCalcularJurosSimples() {
        
        Test.startTest();
        Decimal resultado = FinancialService.calcularParcela(10000, 12, 12);
        Test.stopTest();
        
        System.assertEquals(888.49, resultado, 'O cálculo da parcela Price está incorreto.');
    }
    
    @isTest
    static void deveCalcularSemJuros() {
        
        Decimal resultado = FinancialService.calcularParcela(1200, 0, 12);
        System.assertEquals(100.00, resultado, 'Deveria ser uma divisão simples quando juros é 0.');
    }
    
    @isTest
    static void deveRejeitarParametrosInvalidos() {
        try {
            FinancialService.calcularParcela(0, 10, 10);
            System.assert(false, 'Deveria ter lançado exceção para valor 0');
        } catch (IllegalArgumentException e) {
            System.assert(true); // Sucesso
        }
        
        try {
            FinancialService.calcularParcela(1000, -5, 10);
            System.assert(false, 'Deveria ter lançado exceção para juros negativo');
        } catch (IllegalArgumentException e) {
            System.assert(true); // Sucesso
        }
    }
}