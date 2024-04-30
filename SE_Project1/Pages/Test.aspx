<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="SE_Project1.Pages.Test" %>


<!DOCTYPE html>
<html>
<head>
    <title>Evaluation Form</title>
    <style>
        /* Center the container and its content */
        .container {
            display: flex;
            justify-content: center; /* Centers the checkboxes and numbers horizontally */
            align-items: center; /* Centers the checkboxes and numbers vertically */
            margin-top: 10px; /* Adjust the top margin as needed to center vertically */
            flex-direction: column; /* Stacks the containers vertically */
        }
        
        /* Style the individual rows */
        .row {
            display: flex;
            justify-content: center; /* Centers the items horizontally */
            margin-bottom: 10px; /* Adds space between the number and checkbox rows */
            gap: 12px;
        }

        .row2 {
            display: flex;
            justify-content: center; /* Centers the items horizontally */
            margin-bottom: 10px; /* Adds space between the number and checkbox rows */
        }
        
        /* Style each number and checkbox */
        .item {
            margin: 0 15px; /* Add space between each item */
        }
    </style>
    
    <script>
        /*JavaScript code to make sure only one box is checked at a time*/
        function selectOnlyOne(form, checkbox) {
            // Get all checkboxes in the form
            var checkboxes = form.querySelectorAll('input[type="checkbox"]');

            // Uncheck all other checkboxes
            checkboxes.forEach(function (cb) {
                if (cb !== checkbox) {
                    cb.checked = false;
                }
            });
        }
    </script>
</head>
<body>

    <p><strong>1. FYP Poster:</strong></p>
    <form class="container evaluation-form">
        <!-- Row of numbers -->
        <div class="row">
            <label class="item"> 1 </label>
            <label class="item"> 2 </label>
            <label class="item"> 3 </label>
            <label class="item"> 4 </label>
            <label class="item"> 5 </label>
            <label class="item"> 6 </label>
            <label class="item"> 7 </label>
            <label class="item"> 8 </label>
            <label class="item"> 9 </label>
            <label class="item"> 10 </label>
        </div>

            <!-- Row of checkboxes -->
        <div class="row2">
        
            <div class="item">
                <input type="checkbox" id="rating1" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating2" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating3" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating4" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating5" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating6" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating7" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating8" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating9" name="rating" onclick="selectOnlyOne(this)">
            </div>
            <div class="item">
                <input type="checkbox" id="rating10" name="rating" onclick="selectOnlyOne(this)">
            </div>
        </div>
    </form>


</body>
</html>
