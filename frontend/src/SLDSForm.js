import React, {Component} from 'react';

class SLDSForm extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return(
            <div className="slds-form">
                {this.props.children}
            </div>
        );
    }
}

export default SLDSForm; 