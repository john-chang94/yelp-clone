import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import * as actions from '../actions/authActions';

class Register extends Component {
    state = {
        first_name: '',
        last_name: '',
        email: '',
        password: '',
        confirmPassword: ''
    }

    handleChange = e => {
        this.setState({
            [e.target.id]: e.target.value
        })
    }

    handleSubmit = e => {
        e.preventDefault();
        this.props.register(this.state);
    }

    render() {
        const { first_name, last_name, email, password, confirmPassword } = this.state;
        return (
            <div className="full flex-center">
                <div className="w-50">
                    <h4>Create a new account</h4>
                    <form onSubmit={this.handleSubmit}>
                        <div className="input-field">
                            <input type="text" id="first_name" value={first_name} onChange={this.handleChange} />
                            <label htmlFor="first_name">First Name</label>
                        </div>
                        <div className="input-field">
                            <input type="text" id="last_name" value={last_name} onChange={this.handleChange} />
                            <label htmlFor="last_name">Last Name</label>
                        </div>
                        <div className="input-field">
                            <input type="text" id="email" value={email} onChange={this.handleChange} />
                            <label htmlFor="email">Email</label>
                        </div>
                        <div className="input-field">
                            <input type="password" id="password" value={password} onChange={this.handleChange} />
                            <label htmlFor="password">Password</label>
                        </div>
                        <div className="input-field">
                            <input type="password" id="confirmPassword" value={confirmPassword} onChange={this.handleChange} />
                            <label htmlFor="confirmPassword">Confirm Password</label>
                        </div>
                        <div>
                            <button className="btn">Register</button>
                        </div>
                    </form>
                    <div className="mt-1">
                        <p>Already have an account? <Link to='/signin'>Sign in here.</Link></p>
                    </div>
                </div>
            </div>
        )
    }
}

export default connect(null, actions)(Register);