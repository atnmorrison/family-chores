import React, {Component} from 'react';
import SLDSForm from './SLDSForm';
import SLDSInputText from './SLDSInputText';

class RegisterForm extends React.Component{
    
    constructor(props) {
        super(props);
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
                    <SLDSForm>
                        <SLDSInputText label="First Name" placeholder="First Name" id="firstName" />
                        <SLDSInputText label="Last Name" placeholder="Last Name" id="lastName" />
                        <SLDSInputText label="Email" placeholder="Email" id="email" />
                        <SLDSInputText label="Family Team Name" placeholder="Family Team Name" id="familyTeamName" />
                    </SLDSForm>
                </div>
            </article>
        );
    }
}

export default RegisterForm;