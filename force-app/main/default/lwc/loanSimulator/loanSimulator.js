import { LightningElement, track } from 'lwc';

export default class LoanSimulator extends LightningElement {

    @track sliderValorSolicitado = 1000;
    @track sliderQtdParcelas = 12;
    resultado;

    handleSliderValorChange(event) {
        this.sliderValorSolicitado = event.target.value;
    }

    handleSliderParcelaChange(event){
        this.sliderQtdParcelas = event.target.value;
    }

    calcular(){
        console.log("Valor:", this.sliderValorSolicitado);
    }

}