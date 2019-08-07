<%@ Page Title="Demo Two" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo_Two.aspx.cs" Inherits="Demo.Demo_Two" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>
    <button id="submitButton" type="button" class="btn btn-secondary">AJAX Call</button>

    <!-- This call can be used for sending/recieving collected data from form tools, SQL queries, or other controls - It's very flexible and scalable. -->
    <script type="text/javascript">
        $("#submitButton").click(function () {                          // Fire AJAX on click.
            $.ajax({
                type: "POST",
                url: "Demo_Two.aspx/returnAjax",                        // Calling returnAjax method from "Demo_Two.aspx.cs".
                data: "{}",                                             // Passing no parameters.
                contentType: "application/json; charset=utf-8",         // JSON string.
                dataType: "json",                                       

                success: function (myData) {
                    alert("Ajax successful: " + myData.d);              // This is the data returned from the [WebMethod]returnAjax.
                },

                error: function (xhr, ajaxOptions, thrownError) {
                    console.log(thrownError);                           // Error handling.
                    alert(thrownError);
                }
            });
        });
    </script>

</asp:Content>
