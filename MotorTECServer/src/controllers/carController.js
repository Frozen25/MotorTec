const controller = {};

controller.getNew = (request, response) => {
	request.getConnection((err, connection) => {
		connection.query('CALL getNewCar();', (err, customers) => {
			if (err) {
				console.log(err);
			}
			//console.log(customers);
			response.send(customers);
		});
	});
};

controller.getUsed = (request, response) => {
	request.getConnection((err, connection) => {
		connection.query('CALL getUsedCar();', (err, customers) => {
			if (err) {
				console.log(err);
			}
			//console.log(customers);
			response.send(customers);
		});
	});
};

controller.getOne = (request, response) => {
	request.getConnection((err, connection) => {		
		// Get an employee
		const id = request.params.id;
		connection.query('CALL getCar(?);', [id], (err, rows, fields) => {
			if (err) {
				console.log(err);
			}
			response.send(rows);
		});	
	});
};


/*
var post  = {id: 1, title: 'Hello MySQL'};
var query = connection.query('INSERT INTO posts SET ?', post, function(err, result) {
  // Neat!
});
console.log(query.sql);*/

controller.save = (request, response) => {
	const sql = 'CALL AddCustomer(?, ?, ?)';
	const name = request.body.name;
	const address = request.body.address;
	const phone = request.body.phone;

	request.getConnection((err, connection) => {
		connection.query(sql, [name, address, phone], (err, customer) => {
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

controller.update = (request, response) => {
	const sql = 'CALL UpdateCustomer(?, ?, ?, ?);';
	const id = request.params.id;
	const name = request.body.name;
	const address = request.body.address;
	const phone = request.body.phone;

	request.getConnection((err, connection) => {
		connection.query(sql, [id, name, address, phone], (err, rows) => {
			if (err) {
				console.log(err);
				response.send('Error');
			} else {
				response.send('Successfully Updated');
			}
		});
	})
};

controller.delete = (request, response) => {
	const id = request.params.id;
	request.getConnection((err, connection) => {
		connection.query('DELETE FROM Customer WHERE idCustomer = ?', [id], (err, rows) => {
			if (err) {
				console.log(err);
			}
			response.send(rows);
		});
	});
};

module.exports = controller;