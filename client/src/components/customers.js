
import React from 'react'

    const Customers = ({ customer }) => {
      return (
        <div>
          <center><h1>Contact List</h1></center>
          {customer.map((customer) => (
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">{customer.firstname}</h5>
                <h5 class="card-title">{customer.lastname}</h5>
              </div>
            </div>
          ))}
        </div>
      )
    };

    export default Customers