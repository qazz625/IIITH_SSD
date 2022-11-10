from flask import Flask, request, jsonify, session
from flask_sqlalchemy import SQLAlchemy
from flask_login import(LoginManager, login_manager, login_user, logout_user, login_required, UserMixin)
app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///user.db"
app.config["SECRET_KEY"] = "abcdefg"

db = SQLAlchemy(app)
login_manager = LoginManager()

login_manager.init_app(app)

app.app_context().push()

class User(db.Model, UserMixin):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(80), nullable=False)
	email = db.Column(db.String(80), unique=True, nullable=False)
	password = db.Column(db.String(80), nullable=False)

db.create_all()

@login_manager.user_loader
def load_user(email):
	return User.query.get(email)

# def test_connection(self):
#     with app.app_context():
#         db.create_all()

@app.route("/user/signup", methods=["POST"])
def register():
	if request.method == "POST":
		req = request.get_json()
		name = req['name']
		email = req['email']
		password = req['password']

		check_user = User.query.filter_by(email=email).first()
		if check_user is None:
			print(name, email, password)
			newUser = User(name=name, email=email, password=password)
			db.session.add(newUser)
			db.session.commit()
			message = "USER SUCCESSFULLY REGISTERED"
		else:
			message = "USER ALREADY EXISTS"
	return jsonify({"message": message})


@app.route("/user/signin", methods=["POST"])
def signin():
	if 'email' in session:
		message = "YOU ARE ALREADY LOGGED IN"
	elif(request.method == "POST"):
		req = request.get_json()
		email = req['email']
		password = req['password']
		check_user = User.query.filter_by(email=email).first()
		if check_user is not None:
			if check_user.password == password:
				login_user(check_user)
				session['email'] = email
				message = "LOGGED IN"
			else:
				message = "INCORRECT PASSWORD"
		else:
			message = "NO SUCH USER"
	return jsonify({"message": message})

@app.route("/user/signout", methods=["GET"])
def signout():
	if 'email' not in session:
		message = "YOU ARE NOT LOGGED IN"
	else:
		message = "LOGGED OUT SUCCESSFULLY"
		session.clear()
	return jsonify({"message": message})

if __name__ == '__main__':
	app.run()


