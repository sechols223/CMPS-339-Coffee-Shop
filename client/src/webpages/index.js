import React from 'react';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import Home from './customers';
import Customer from './customers';
const Webpages = () => {
    return(
        <Router>
            <Route exact path="/" component= {Home} />
            <Route path = "/user" component = {Customer} />
        </Router>
    );
};
export default Webpages;