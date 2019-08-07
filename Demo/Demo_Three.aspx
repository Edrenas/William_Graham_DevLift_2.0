<%@ Page Title="Demo Three" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo_Three.aspx.cs" Inherits="Demo.Demo_Three" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>

    <br />
    <div class="group in-left-slower">
        <input id="name" type="text" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>Name</label>
    </div>
    <div class="group in-left-slower">
        <input id="age" type="number" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>Age</label>
    </div>
    <div class="group in-left-slower">
        <input id="effectiveDate" type="date">
        <span class="highlight"></span>
        <span class="bar"></span>
        <label class="labelDates">Effective Date</label>
    </div>
    <div class="group in-left-slower">
        <input id="expiryDate" type="date" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label class="labelDates">Expiry Date</label>
    </div>
    <div class="group in-left-slower">
        <input id="transType" type="text" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>Transaction Type</label>
    </div>
    <div class="group in-left-slower">
        <input id="clientID" type="text">
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>Client ID</label>
    </div>

    <button id="submitButton" type="button" class="btn btn-secondary">Collect Data</button>

    <!-- This call can be used for sending/recieving collected data from form tools, SQL queries, or other controls - It's very flexible and scalable. -->
    <script type="text/javascript">
        $("#submitButton").click(function () {

            // Collect variables on click event.
            var name = document.getElementById("name").value;
            var age = document.getElementById("age").value;
            var effDate = document.getElementById("effectiveDate").value;
            var expDate = document.getElementById("expiryDate").value;
            var transType = document.getElementById("transType").value;
            var clientID = document.getElementById("clientID").value;

            $.ajax({                                                    // Fire AJAX on click.
                type: "POST",
                url: "Demo_Three.aspx/returnAjax",                      // Calling returnAjax method from "Demo_Three.aspx.cs".
                data: "{ Name: '" + name +                              // Send variables through call. Can be individual or as a collection - I personally like to write each one out.
                "', 'Age': '" + age +
                "', 'EffDate': '" + effDate +
                "', 'ExpDate': '" + expDate +
                "', 'TransType': '" + transType +
                "', 'ClientID': '" + clientID + "' }",
                contentType: "application/json; charset=utf-8",         // JSON string.
                dataType: "json",

                success: function (myData) {
                    alert("First Name: " + myData.d["Name"] +
                        "\nAge: " + myData.d["Age"] +
                        "\nEffective Date: " + myData.d["EffDate"] +
                        "\nExpiry Date: " + myData.d["ExpDate"] +
                        "\nTransaction Type: " + myData.d["TransType"] +
                        "\nClient ID: " + myData.d["ClientID"]);              // This is the data returned from the [WebMethod]returnAjax.
                },

                error: function (xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseJSON);                           // Error handling.
                }
            });
        });
    </script>

</asp:Content>
