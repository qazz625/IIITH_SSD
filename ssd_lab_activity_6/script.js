let sunameerror = ""

function keyPressHandler(event){
	let suname = document.getElementById("suname").value.toString();
	console.log(suname);
	let upper = 0;
	let num = 0;
	let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	let numeric = "0123456789";
	console.log(suname.length);
	for(let i=0; i<suname.length; i++){
		console.log(suname.charAt(i));
		if(uppercase.includes(suname.charAt(i))){
			upper = 1;
		}
		if(numeric.includes(suname.charAt(i))){
			num = 1;
		}
	}
	console.log(upper);
	console.log(num);
	if(upper == 0 || num == 0){
		sunameerror = "Invalid Username";
		document.getElementById("sunameerror").innerHTML = sunameerror;
	}
	else{
		sunameerror = "";
		document.getElementById("sunameerror").innerHTML = sunameerror;
	}
}

function matchpass(){
	var spass = document.getElementById("spass").value;
	var cpass = document.getElementById("cpass").value;
	if(cpass != spass){
		spasserror = "Passwords do not match";
		cpasserror = "Passwords do not match";
	}
	else{
		spasserror = "";
		cpasserror = "";
	}
	document.getElementById("spasserror").innerHTML = spasserror;
	document.getElementById("cpasserror").innerHTML = cpasserror;
}
function submit(){
	var mname = document.getElementById("mname").value;
	var gemail = document.getElementById("gemail").value.toString();
	// var suname = document.getElementById("suname").value;
	var spass = document.getElementById("spass").value;
	var cpass = document.getElementById("cpass").value;
	var tlead = document.getElementById("tlead").value;

	let mnameerror="";
	let spasserror="";
	let cpasserror="";
	let gemailerror="";
	if(mname == ""){
		mnameerror = "Invalid Manager Name";
	}

	if(spass == ""){
		spasserror = "Invalid Password";
	}

	if(cpass == ""){
		cpasserror = "Invalid Password";
	}

	if(gemail == ""){
		gemailerror = "Invalid Email";
	}

	if(cpass != spass){
		spasserror = "Passwords do not match";
		cpasserror = "Passwords do not match";
	}

	var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	if (gemail.match(validRegex)) {
		gemailerror = "";
	 }
	 else{
	 	gemailerror = "Invalid Email";
	 }

	let suname = document.getElementById("suname").value.toString();
	console.log(suname);
	let upper = 0;
	let num = 0;
	let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	let numeric = "0123456789";
	let sunameerror = "";
	console.log(suname.length);
	for(let i=0; i<suname.length; i++){
		console.log(suname.charAt(i));
		if(uppercase.includes(suname.charAt(i))){
			upper = 1;
		}
		if(numeric.includes(suname.charAt(i))){
			num = 1;
		}
	}
	console.log(upper);
	console.log(num);
	if(upper == 0 || num == 0){
		sunameerror = "Invalid Username";
		document.getElementById("sunameerror").innerHTML = sunameerror;
	}
	else{
		sunameerror = "";
		document.getElementById("sunameerror").innerHTML = sunameerror;
	}

	document.getElementById("spasserror").innerHTML = spasserror;
	document.getElementById("cpasserror").innerHTML = cpasserror;
	document.getElementById("gemailerror").innerHTML = gemailerror;
	document.getElementById("mnameerror").innerHTML = mnameerror;

	if(spasserror == "" && spasserror=="" && mnameerror=="" && sunameerror=="" && gemailerror==""){
		alert("Name:" + mname + "\n" + "Email: " + gemail + "\n" + "Username: " + suname + "\n" + "Team Lead: " + tlead
			+ "\n" + "Team Members: ");
	}

	// let gemailerror=""
	console.log(mname);
	console.log(gemail);
}
