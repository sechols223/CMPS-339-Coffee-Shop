import React, { useState, useEffect }  from 'react';
const Home = () => {
const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [customers, setCustomers] = useState([]);
    useEffect(() => {
        fetch("'http://localhost:3001/api/customers'")
            .then(res => res.json())
            .then(
                (data) => {
                    setIsLoaded(true);
                    setCustomers(data);
                },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                }
            )
      }, [])
if (error) {
        return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
        return <div>Loading...</div>;
    } else {
        return (
            <div>
          <center><h1>Customer List</h1></center>
          {customers.map((customer) => (
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">{customer.firstname}</h5>
                <h5 class="card-title">{customer.lastname}</h5>
              </div>
            </div>
          ))}
        </div>
            )
    }
}
export default Home;