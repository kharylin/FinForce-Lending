/**
 * @description       : Classe utilitária responsável pela lógica matemática financeira do projeto
 * @author            : Kharylin Dias
 * @group             : FinForce Lending
 * @last modified on  : 01-12-2026
 * @last modified by  : Kharylin Dias
 * Fórmula Tabela Price: PMT = PV * ( i * (1+i)^n ) / ( (1+i)^n - 1 )
 **/

public with sharing class FinancialService {
    
    @AuraEnabled
    public static Decimal calcularParcela(Decimal valorEmprestimo, Decimal taxaJurosAnual, Integer meses){
        
        if (valorEmprestimo == null || valorEmprestimo <= 0 ||
            taxaJurosAnual == null || taxaJurosAnual < 0 ||
        meses == null || meses <= 0) {
            throw new AuraHandledException('Parâmetros inválidos.');
        }
        
        
        if (taxaJurosAnual == 0) {
            return (valorEmprestimo / meses).setScale(2, RoundingMode.HALF_UP);
        }
        
        Double pv = valorEmprestimo.doubleValue();
        Double taxaMensal = (taxaJurosAnual.doubleValue() / 100) / 12;
        
        Double fator = Math.pow(1 + taxaMensal, meses);
        Double pmt = pv * (taxaMensal * fator) / (fator - 1);
        
        return Decimal.valueOf(pmt).setScale(2, RoundingMode.HALF_UP); // converte para Decimal
    }
}