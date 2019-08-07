<%@ Page Title="Demo One" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Demo_One.aspx.cs" Inherits="Demo.Demo_One" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>

    <h2><%: Title %></h2>

    <!-- When we return with data from the server on page click we can display financial data being tracked in the database. You can report on whaterver you want to if you the data. -->
    <!-- These are also ideal to work with SQL statements or web api data as long as it comes in a usable string. (Statistics readily available to help make small business decisions.) -->
    <div class="container">
        <div class="row">

            <div class="jumbotron text-center">
                <p>Below are our quarterly reports returned from the database...</p>
            </div>

            <div class="ct-chart ct-golden-section .ct-major-third" id="chart1"></div>

            <div class="jumbotron text-center">
                <p>This chart represents our annual growth of clientelle over the last year...</p>
            </div>

            <div class="ct-chart ct-golden-section .ct-minor-third" id="chart2"></div>

            <div class="jumbotron text-center">
                <p>Here we have revenue spending for advertisment and google ad-sense...</p>
            </div>

            <div class="ct-chart ct-golden-section .ct-minor-third" id="chart3"></div>

            <script>
                // Bar chart data.
                var data = {
                    labels: ['1st Quarter', '2nd Quarter', '3rd Quarter', '4th Quarter',],
                    series: [
                        [1, 4, 5, 7],
                        [2, 5, 6, 8],
                        [3, 6, 7, 9]
                    ]
                };

                var options = {
                    seriesBarDistance: 15       // Distance in between individual bars. (Bar chart.)
                };

                var responsiveOptions = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function (value) {
                                return value[0];
                            }
                        }
                    }]
                ];

                // Create new charts.
                new Chartist.Bar('#chart1', data, options, responsiveOptions);

                new Chartist.Line('#chart2', {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],
                    series: [[185, 187, 189, 191, 192, 195, 197, 199, 202, 203, 201, 205]]
                });

                // Pie chart data.
                var data = {
                    series: [5, 3, 4]
                };

                var sum = function (a, b) { return a + b };

                new Chartist.Pie('#chart3', data, {
                    labelInterpolationFnc: function (value) {
                        return Math.round(value / data.series.reduce(sum) * 100) + '%';
                    }
                });
            </script>
        </div>
    </div>

</asp:Content>
