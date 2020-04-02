var items = [];

var counter = 1;

//formname = orderForm


function setWarning(text) {

    var alertWarningHTML = ''
    alertWarningHTML += '<div class="alert alert-dismissible alert-danger">'
    alertWarningHTML += '<button type="button" class="close" data-dismiss="alert">&times;</button>'
    alertWarningHTML += '<h4 class="alert-heading">Warning!</h4>'
    alertWarningHTML += '<p class="mb-0">' + text + '</p>'
    alertWarningHTML += '</div>'

    document.getElementById('message').style.display = 'block'
    document.getElementById('message').innerHTML = alertWarningHTML;
}

function validate() {
    if (isNaN(document.orderForm.itemQty.value) || document.orderForm.itemQty.value == '') {
        setWarning('Quantity has to be a positive number and cannot be empty either.');
        return true;
    } else if (parseInt(document.orderForm.itemQty.value) < 0) {
        setWarning('Quantity has to be a positive number.');
        return true;

    } else if (isNaN(document.orderForm.itemPrice.value) || document.orderForm.itemPrice.value == '') {
        setWarning('Price has to be a positive number and cannot be empty either.');
        return true;

    } else if (parseInt(document.orderForm.itemPrice.value) < 0) {
        setWarning('Price has to be a positive number.');
        return true;
    }
    return false;
}

function addItem() {
    var item = {};
    if (validate()) {
        return;
    }
    item.id = counter;
    item.itemName = document.orderForm.itemName.value
    item.itemCode = document.orderForm.itemCode.value
    item.itemQty = document.orderForm.itemQty.value
    item.itemUnitPrice = document.orderForm.itemPrice.value
    item.itemNetPrice = parseInt(item.itemUnitPrice) * parseInt(item.itemQty)

    ++counter

    console.log('Item')
    console.log(item)

    var table = document.getElementById("ordersTable").getElementsByTagName('tbody')[0];
    var row = table.insertRow(table.rows.length);

    var idCell = row.insertCell(0);
    var itemNameCell = row.insertCell(1);
    var itemCodeCell = row.insertCell(2);
    var itemQtyCell = row.insertCell(3);
    var itemUnitPriceCell = row.insertCell(4);
    var itemNetPriceCell = row.insertCell(5);

    idCell.innerText = item.id;
    itemNameCell.innerText = item.itemName;
    itemCodeCell.innerText = item.itemCode;
    itemQtyCell.innerText = item.itemQty;
    itemUnitPriceCell.innerText = item.itemUnitPrice;
    itemNetPriceCell.innerText = item.itemNetPrice;

    items.push(item);
    //items.push(Object.assign({},item));		//pushes a copy of item in case of global declaration

    totalBill();
}

function totalBill() {
    var itemCount = items.length;
    var itemAmount = 0;
    var netPayable = 0;
    items.forEach(i => {
        itemAmount += parseInt(i.itemNetPrice)
    });

    netPayable = parseInt(itemAmount) * 118 / 100;
    document.getElementById('count').innerText = ''
    document.getElementById('cost').innerText = ''

    document.getElementById('count').innerText = itemCount
    document.getElementById('cost').innerText = itemAmount
    document.getElementById('cost1').innerText = netPayable
}

function checkOut() {
    $("#paymentModalCenter").modal();
    document.getElementById("total_billing").innerText = document.getElementById('cost1').innerText;
}

function dataValid() {
    //address
    let addr = document.getElementById('inputAddress').value;
    console.log("address: " + addr + "len: " + addr.length)
    if (addr.length == 0) {
        alert('Enter address!');
        console.log("ad")
        return false;
    }
    if ((addr.length < 20) || (addr.length > 100)) {
        alert(" Your textarea must be 20 to 100 characters");
        return false;
    }
    //city
    var city = document.getElementById('inputCity').value;
    var cityregex = /^[A-Za-z]+$/;
    if (city.length == 0) {
        alert('Enter city!');
        return false;
    }
    if (!city.match(cityregex)) {
        alert('Invalid city!');
        return false;
    }

    //pin
    var pinregex = /^[1-9][0-9]{5}$/;
    var pin = document.getElementById('inputPin').value;
    if (pin.length == 0) {
        alert('Enter PIN Code!');
        return false;
    }
    if (!pin.match(pinregex)) {
        alert('Invalid PIN Code!');
        return false;
    }

    //state
    var stateregex = /^[A-Za-z]+[\ ]+[A-Za-z]+$/;
    var state = document.getElementById('inputState').value;
    if (state.length == 0) {
        alert('Enter state!');
        return false;
    }
    if (!state.match(stateregex)) {
        alert('Invalid State!');
        return false;
    }

    //card number
    //Visa card starting with 4, length 13 or 16 digits.
    var cardvisa = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
    //MasterCard starting with 51 through 55, length 16 digits.
    var cardmaster = /^(?:5[1-5][0-9]{14})$/;
    var card = document.getElementById('inputCardNumber').value;
    if (card.length == 0) {
        alert('Enter Card Number!');
        return false;
    }
    if (card.match(cardvisa)) {
        document.getElementById('cardType').innerText = "Visa";
    }
    else if (card.match(cardmaster)) {
        document.getElementById('cardType').innerText = "Master";
    }
    else {
        alert('Invalid Card!');
        return false;
    }

    //expiry
    var expiry = document.getElementById('inputExpiry').value;
    var arrexp = expiry.split('/');
    var mm = parseInt(arrexp[0]);
    var yy = parseInt(arrexp[1]);
    var expiryregex = /^(0?[1-9]|1[012])[\/]\d{2}$/;
    if (expiry.match(expiryregex)) {
        if (mm < 1 || mm > 12) {
            alert('Invalid Card Month!');
            return false;
        }
        if (yy < 20) {
            alert('Card Expired!');
            return false;
        }
    }
    else {
        alert('Invalid Expiry Format!');
        return false;
    }

    //cvv
    var cvv = document.getElementById('inputCvv').value;
    var cvvregex = /^[0-9]{3}$/;
    if (!cvv.match(cvvregex)) {
        alert('Invalid CVV!');
        return false;
    }


    invoicePrint();

}

function invoicePrint() {

    alert("Order Placed Successfully!")

    $("#paymentModalCenter").modal("hide");
    $("#invoiceModalCenter").modal();

    $('#ordersTable1').empty();
    $("#ordersTable").clone().appendTo("#ordersTable1");


    document.getElementById("countx").innerText = document.getElementById('count').innerText;
    document.getElementById("costx").innerText = document.getElementById('cost').innerText;
    document.getElementById("total_billingx").innerText = document.getElementById('cost1').innerText;

}
