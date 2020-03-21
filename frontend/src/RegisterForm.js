import React, {Component} from 'react';
import FCForm from './FCForm';
import FCInputText from './FCInputText';
import FCInputPassword from './FCInputPassword';
import FCButton from './FCButton';

class RegisterForm extends React.Component{
    
    constructor(props) {
        super(props);
        this.state = {familyTeamName: "", firstName: "", lastName: "", email: ""};
    }

    submit() {
        console.log(this.state);
    }

    updateFormSate(inputId, value) {
        let update = {};
        update[inputId] = value;
        this.setState(update);
    }

    render() {
        return(
            <article className="slds-card">
                <div className="slds-card__header slds-grid">
                  <header>
                    <div className="slds-media__figure">
                      <span className="slds-assistive-text">
                        Register 
                      </span>
                    </div>
                    <div className="slds-media__body">
                        <h2 className="slds-card__header-title">
                            <span className="slds-truncate">Register</span>
                        </h2>
                    </div>
                  </header>
                </div>
                <div className="slds-card__body slds-card__body_inner">
                    <FCForm>
                        <FCInputText label="Family Team Name" placeholder="Family Team Name" id="familyTeamName" onChange={(id, value) => {this.updateFormSate(id, value)}}/>
                        <FCInputText label="First Name" placeholder="First Name" id="firstName" onChange={(id, value) => {this.updateFormSate(id, value)}} />
                        <FCInputText label="Last Name" placeholder="Last Name" id="lastName" onChange={(id, value) => {this.updateFormSate(id, value)}} />
                        <FCInputText label="Email" placeholder="Email" id="email" onChange={(id, value) => {this.updateFormSate(id, value)}} />
                        <FCInputPassword label="Password" placeholder="Password" id="password" onChange={(id, value) => {this.updateFormSate(id, value)}} />
                        <FCButton className="slds-button_brand" label="Submit" onClick={() => {this.submit()}}  />

                    </FCForm>
                </div>
            </article>
        );
    }
}

export default RegisterForm;