import { LightningElement, track } from 'lwc';
import simular from '@salesforce/apex/LoanController.simular';

export default class LoanSimulator extends LightningElement {

    @track sliderValorSolicitado = 1000;
    @track sliderQtdParcelas = 12;
    @track resultadoParcela;

    handleSliderValorChange(event) {
        this.sliderValorSolicitado = event.target.value;
    }

    handleSliderParcelaChange(event){
        this.sliderQtdParcelas = event.target.value;
    }

    async calcularSimulacao(){
        this.resultadoParcela = null;
      
        const inputDoIP = {
            valor: this.sliderValorSolicitado,
            meses: this.sliderQtdParcelas
        };
        
        try {

            const result = await simular({ dadosDaTela: inputDoIP });
        
            console.log('JSON:', JSON.stringify(result));
            
            if (result?.valorParcela) {
                this.resultadoParcela = result.valorParcela; // mostra valor na tela
            } else {
                console.error('O retorno veio vazio ou sem a chave esperada:', result);
            }
        }
        catch (error) {
            console.error('Erro na chamada Apex:', error);
        }

    }

}