import React, {Component} from 'react';


class FCButton extends React.Component{

    constructor(props) {
        super(props)
    }


    render() {
        return (
        <button className={this.props.className} onClick={this.props.onClick}>{this.props.label}</button>
        )
    }


}

export default FCButton