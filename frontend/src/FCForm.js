import React, {Component} from 'react';

class FCForm extends React.Component {
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

export default FCForm; 