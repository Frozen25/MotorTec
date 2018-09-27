const controller = {};

controller.getSell = (request, response) => {
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

module.exports = controller;