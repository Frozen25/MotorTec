const location = {}

location.getCountry = (request, response) => {
	request.getConnection((err, connection) => {
		connection.query('SELECT Nombre FROM Pais;', (err, country) => {
			if (err) {
				console.log(err);
			}
			response.send(country);
		});
	});
};

location.getProvince = (request, response) => {
	request.getConnection((err, connection) => {
		const id = request.params.id;
		const country = request.params.id;
		connection.query('CALL getProvinceFromCountry(?);', [id],(err, customers) => {
			if (err) {
				console.log(err);
			}
			//console.log(customers);
			response.send(customers);
		});
	});
};

location.getCanton = (request, response) => {
	request.getConnection((err, connection) => {
		const id = request.params.id;
		const country = request.params.id;
		connection.query('CALL getCantonFromProvince(?);', [id],(err, customers) => {
			if (err) {
				console.log(err);
			}
			//console.log(customers);
			response.send(customers);
		});
	});
};

location.getDistrict = (request, response) => {
	request.getConnection((err, connection) => {
		const id = request.params.id;
		const country = request.params.id;
		connection.query('CALL getDistrictFromCanton(?);', [id],(err, customers) => {
			if (err) {
				console.log(err);
			}
			//console.log(customers);
			response.send(customers);
		});
	});
};

module.exports = location;