const controller = {};

controller.getNew = (request, response) => {
	request.getConnection((err, connection) => {
		const id = request.params.id;
		connection.query('CALL getNewCar(?);', [id], (err, customers) => {
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
		const id = request.params.id;
		connection.query('CALL getUsedCar(?);', [id], (err, customers) => {
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
		connection.query('CALL getCarWithImages(?);', [id], (err, rows, fields) => {
			if (err) {
				console.log(err);
			}
			response.send(rows);
		});	
	});
};

controller.getCs = (request, response) => {
	request.getConnection((err, connection) => {		
		// Get an employee
		const id = request.params.id;
		connection.query('SELECT Nombre FROM Concesionario', [id], (err, rows, fields) => {
			if (err) {
				console.log(err);
			}
			response.send(rows);
		});	
	});
};

controller.getCarByUser = (request, response) => {
	request.getConnection((err, connection) => {		
		// Get an employee
		const id = request.params.id;
		const cs = request.params.cs;
		connection.query('CALL getCarByUser(?, ?);', [id, cs], (err, rows, fields) => {
			if (err) {
				console.log(err);
			}
			response.send(rows);
		});	
	});

};

controller.getMarca = (request, response) => {
	request.getConnection((err, connection) => {		
		// Get an employee
		const sql = 'SELECT Nombre FROM Marca';
		connection.query(sql, (err, rows, fields) => {
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
	const sql = 'CALL addCAR(?, ?, ?, ?, ?, ?, ?, ?, ?)';
	const matricula = request.body.matricula;
	const modelo = request.body.modelo;
	const color = request.body.color;
	const kilometraje = request.body.kilometraje;
	const csName = request.body.csname;
	const marcaName = request.body.marcaname;
	const link = request.body.link;
	const price = request.body.price;
	const date = request.body.date;

	request.getConnection((err, connection) => {
		connection.query(sql, [matricula, modelo, color, kilometraje, marcaName, csName, link, price, date], (err, customer) => {
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