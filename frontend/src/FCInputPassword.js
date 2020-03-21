import React, {Component} from 'react';

class FCInputPassword extends React.Component{

    constructor(props){
        super(props);  
        this.passwordInput = <input type="password" id={props.id} placeholder={props.placehoder} className="slds-input" />;
        this.passwordInputConfirm = <input type="password" id={props.id+'_confirm'} placeholder={props.placehoder} className="slds-input" />;
    }

    render(){
        return(
          <div>
            <div className="slds-form-element slds-form-element_stacked">
                <label className="slds-form-element__label" htmlFor={this.props.id}>{this.props.label}</label>
                <div className="slds-form-element__control">
                    {this.passwordInput}
                </div>
            </div>
            <div className="slds-form-element slds-form-element_stacked">
                <label className="slds-form-element__label" htmlFor={this.props.id+'_confirm'}>Re-Enter {this.props.label}</label>
                <div className="slds-form-element__control">
                    {this.passwordInputConfirm}
                </div>
            </div>            
          </div>
        )

    }

}

export default FCInputPassword;