<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Inventory Management System Invoice</title>

		<style>
			.content-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				color: #555;
			}

			.content-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
			}

			.content-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.content-box table tr td:nth-child(2) {
				text-align: right;
			}

			.content-box table tr.top table td {
				padding-bottom: 20px;
			}

			.content-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}

			.content-box table tr.information table td {
				padding-bottom: 40px;
			}

			.content-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.content-box table tr.details td {
				padding-bottom: 20px;
			}

			.content-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.content-box table tr.item.last td {
				border-bottom: none;
			}

			.content-box table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.content-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.content-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}

			/** RTL **/
			.content-box.rtl {
				direction: rtl;
				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.content-box.rtl table {
				text-align: right;
			}

			.content-box.rtl table tr td:nth-child(2) {
				text-align: left;
			}
		</style>
	</head>

	<body>
    @yield('content')
	</body>
</html>
