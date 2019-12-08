import 'react-app-polyfill/ie11'
import React from 'react';
import ReactDOM from 'react-dom';
import EvalForm from './EvalForm';
  
const element = (
    <EvalForm/>
);
    
ReactDOM.render(
    element,
    document.getElementById('app')
);