let balance = 0;

function buyTokens() {
    let amount = document.getElementById("amount").value;
    if(amount > 0){
        balance += parseInt(amount);
        alert("Tokens purchased successfully!");
    } else {
        alert("Enter valid amount");
    }
}

function checkBalance() {
    document.getElementById("balance").innerText =
        "Your Bond Tokens: " + balance;
}
