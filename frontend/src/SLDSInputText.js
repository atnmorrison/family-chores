import React, {Component} from 'react';

class SLDSInputText extends React.Component{

    render(){
        return(
          <div className="slds-form-element slds-form-element_stacked">
            <label className="slds-form-element__label" htmlFor={this.props.id}>{this.props.label}</label>
              <div className="slds-form-element__control">
                <input type="text" id={this.props.id} placeholder={this.props.placehoder} className="slds-input" />
             </div>
          </div>
        )

    }

}

export default SLDSInputText;