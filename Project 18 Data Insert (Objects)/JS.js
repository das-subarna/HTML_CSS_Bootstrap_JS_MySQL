

function editRow(td) {
    selectedRow = td.parentElement.parentElement;
    document.entryForm.eid.value = selectedRow.cells[0].innerHTML;
    document.entryForm.fname.value = selectedRow.cells[1].innerHTML;
    document.entryForm.lname.value = selectedRow.cells[2].innerHTML;
    document.entryForm.mail.value = selectedRow.cells[3].innerHTML;

    document.entryForm.addbtn.style.display = 'none';
    document.entryForm.updatebtn.style.display = "";
}

function updateEntry() {
    selectedRow.cells[0].innerHTML = document.entryForm.eid.value;
    selectedRow.cells[1].innerHTML = document.entryForm.fname.value;
    selectedRow.cells[2].innerHTML = document.entryForm.lname.value;
    selectedRow.cells[3].innerHTML = document.entryForm.mail.value;

    document.entryForm.addbtn.style.display = '';
    document.entryForm.updatebtn.style.display = "none";
    clear();
}

function addEntry() {
    if (validate()) {
        var table = document.getElementById("empTable").getElementsByTagName('tbody')[0];
        var row = table.insertRow(table.rows.length);
        var idCell = row.insertCell(0);
        var FNameCell = row.insertCell(1);
        var LNameCell = row.insertCell(2);
        var EMailCell = row.insertCell(3);
        var EditCell = row.insertCell(4);
        var DeleteCell = row.insertCell(5);

        idCell.innerText = document.entryForm.eid.value;
        idCell.style.color = "green";
        idCell.style.fontWeight = 900;
        FNameCell.innerText = document.entryForm.fname.value;
        LNameCell.innerText = document.entryForm.lname.value;
        EMailCell.innerText = document.entryForm.mail.value;
        EditCell.innerHTML = '<button type="button" class="btn btn-success" onclick="editRow(this)" title="Edit"><i class="fa fa-edit"></i></button>';
        DeleteCell.innerHTML = '<button type="button" class="btn btn-danger" onclick="deleteRow(this)" title="Delete"><i class="fa fa-trash"></i></button>';

        clear();
    }
}

function deleteRow(td) {
    if (confirm('The entire row will be deleted. Do you want to proceed?')) {
        row = td.parentElement.parentElement;
        document.getElementById("empTable").deleteRow(row.rowIndex);
    }
}


function mySearch() {
    var input, filter, table, tr, td, i, txtValue, tdd, txtValue2;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("empTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {  //traversing all rows
        td = tr[i].getElementsByTagName("td")[0];  //srch by id
        tdd = tr[i].getElementsByTagName("td")[1];  //srch by fname
        tddd = tr[i].getElementsByTagName("td")[2]; //srch by lname
        if (td) {
            txtValue = td.textContent || td.innerText;
            txtValue2 = tdd.textContent || tdd.innerText;
            txtValue3 = tddd.textContent || tddd.innerText;
            //if index of any one is valid
            if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1 || txtValue3.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";  //show
            } else {
                tr[i].style.display = "none"; //hide
            }
        }
    }
}

function validate() {
    var eid = document.getElementById('eid').value;
    var fname = document.getElementById('fname').value;
    var lname = document.getElementById('lname').value;
    var mail = document.getElementById('mail').value;
    //regex
    var letters = /^[A-Za-z]+$/;
    var numbers = /^[0-9]+$/;
    var emailid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    //id validation
    if (eid.match(numbers)) {
        //name validation
        if (fname.match(letters) && lname.match(letters)) {
            if (mail.match(emailid))
                return true;
            else {
                alert('Enter Email in Valid Format!');
                return false;
            }
        }
        else {
            alert('Enter Name in Valid Format!');
            return false;
        }
    }
    else {
        alert('Enter ID in Valid Format!');
        return false;
    }
}

function clear() {
    document.entryForm.eid.value = "";
    document.entryForm.fname.value = "";
    document.entryForm.lname.value = "";
    document.entryForm.mail.value = "";
}
