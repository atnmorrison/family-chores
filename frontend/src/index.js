import 'react-app-polyfill/ie11'
import React from 'react';
import ReactDOM from 'react-dom';
import RegisterForm from './RegisterForm';
  
const element = (
    <RegisterForm />
);
    
ReactDOM.render(
    element,
    document.getElementById('registerContainer')
);