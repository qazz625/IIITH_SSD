import requests
import json

def signin():
	email = input("Enter email-id: ")
	password = input("Enter password: ")

	payload = {
		"email": email,
		"password": password
	}
	resp = requests.post("http://127.0.0.1:5000/user/signin", json=payload).content.decode()
	resp = json.loads(resp)
	print(resp['message'])

def signup():
	name = input("Enter name: ")
	email = input("Enter email-id: ")
	password = input("Enter password: ")

	payload = {
		"name": name,
		"email": email,
		"password": password
	}
	resp = requests.post("http://127.0.0.1:5000/user/signup", json=payload).content.decode()
	resp = json.loads(resp)
	print(resp['message'])

def signout():
	resp = requests.get("http://127.0.0.1:5000/user/signout", json=payload).content.decode()


while True:
	print("1) Sign In")
	print("2) Sign Up")
	print("3) Sign Out")
	op = int(input())
	if op == 1:
		signin()
	elif op == 2:
		signup()
	else:
		signout()