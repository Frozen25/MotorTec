var customer = {};

customer.addCustomer = (request, response) => {
	const sql = 'CALL addClient(?, ?, ?, ?, ?, ?)';
	const name = request.body.name;
	const lastname = request.body.lastname;
	const id = request.body.id;
	const phone = request.body.phone;
	const district = request.body.district;
	const description = request.body.description;

	request.getConnection((err, connection) => {
		connection.query(sql, [name, lastname, id, phone, district, description], (err, customer) => {
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

module.exports = customer;