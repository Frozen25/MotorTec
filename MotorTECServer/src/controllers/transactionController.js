const controller = {};

controller.Sell = (request, response) => {
	const sql = 'CALL addSell(?, ?, ?, ?, ?)';
	const price = request.body.price;
	const date = request.body.date;
	const idCar = request.body.idCar;
	const idCs = request.body.idCs;
	const clientName = request.body.clientName;

	request.getConnection((err, connection) => {
		connection.query(sql, [price, date, idCar, idCs, clientName], (err, customer) => {
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

controller.Buy = (request, response) => {
	const sql = 'CALL buying(?, ?, ?, ?)';
	const csName = request.body.csname;	
	const idCar = request.body.idCar;
	const price = request.body.price;
	const date = request.body.date;

	request.getConnection((err, connection) => {
		connection.query(sql, [csName, idCar, price, date], (err, customer) => {
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

module.exports = controller;