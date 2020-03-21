import React, {Component} from 'react';

class FCInputText extends React.Component{

    constructor(props) {
      super(props);
    }

    handleInput(event){
      this.props.onChange(this.props.id, event.target.value);
    }

    render(){
        return(
          <div className="slds-form-element slds-form-element_stacked">
            <label className="slds-form-element__label" htmlFor={this.props.id}>{this.props.label}</label>
              <div className="slds-form-element__control">
                <input type="text" id={this.props.id} placeholder={this.props.placehoder} className="slds-input" onChange={(event) => {this.handleInput(event)}}/>
             </div>
          </div>
        )

    }

}

export default FCInputText;