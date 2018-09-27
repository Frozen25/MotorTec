var customer = {};

customer.addCustomer = (request, response) => {
	const sql = 'CALL addClient(?, ?, ?, ?, ?, ?, ?)';
	const name = request.body.name;
	const lastname = request.body.lastname;
	const id = request.body.id;
	const phone = request.body.phone;
	const email = request.body.email;
	const district = request.body.district;
	const description = request.body.description;

	request.getConnection((err, connection) => {
		connection.query(sql, [name, lastname, id, phone, email, district, description], (err, customer) => {
			if (err) {
				console.log(err);
				response.send('Error');
			}
			else {
				response.send('Successfully Added');
			}
		});
	});
};

customer.getCustomer = (request, response) => {
	const sql = 'CALL getClient(?);';
	const id = request.params.id;

	request.getConnection((err, connection) => {
		connection.query(sql, [id], (err, customer) => {
			if (err) {
				console.log(err);
				response.send('Error');
			}
			else {
				response.send(customer);
			}
		});
	});
};

module.exports = customer;