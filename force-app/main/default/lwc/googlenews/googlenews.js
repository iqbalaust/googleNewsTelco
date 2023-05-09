import { LightningElement,track, api,wire } from 'lwc';
import getArticleList from '@salesforce/apex/GoogleNewsService.getCallout';

export default class Googlenews extends LightningElement {

    @track dataList = [];
    @track value = 'business';
   
    
    get options() {
        return [
            { label: 'Business', value: 'business' },
            { label: 'Entertainment', value: 'entertainment' },
            { label: 'Health', value: 'health' },
            { label: 'Science', value: 'science' },
            { label: 'Sports', value: 'sports' },
            { label: 'Technology', value: 'technology' },
           
        ];
    }

    handleChange(event){
        this.value = event.detail.value;
        this. getArticleList();
    }

    connectedCallback(){

        this. getArticleList();
    }

    getArticleList(){
        getArticleList({category: this.value})
        .then(result=>{
            this.dataList = result;
        })
        .catch(error=>{
            console.log('error' +error);
        })
    }

}