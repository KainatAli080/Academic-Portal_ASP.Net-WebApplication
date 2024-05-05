<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/PanelLayout.Master" AutoEventWireup="true" CodeBehind="PanelEvaluationForm.aspx.cs" Inherits="SE_Project1.Pages.PanelEvaluationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AddCSSStyle" runat="server">
    <style>
        /* Center the container and its content */
        .container {
            display: flex;
            justify-content: flex-start; /* Centers the checkboxes and numbers horizontally */
            align-items: flex-start; /* Centers the checkboxes and numbers vertically */
            margin-top: 10px; /* Adjust the top margin as needed to center vertically */
            flex-direction: column; /* Stacks the containers vertically */
        }
        
        /* Style the individual rows */
        .row {
            display: flex;
            justify-content: center; /* Centers the items horizontally */
            margin-bottom: 10px; /* Adds space between the number and checkbox rows */
            gap: 12px;
            margin-left: 100px;
        }

        .row2 {
            display: flex;
            justify-content: center; /* Centers the items horizontally */
            margin-bottom: 10px; /* Adds space between the number and checkbox rows */
            margin-left: 95px;
        }
        
        /* Style each number and checkbox */
        .item {
            margin: 0 15px; /* Add space between each item */
        }

        .review-box{
            width:60%;
            height: 120px;
            padding:10px;
            border:2px solid black;
            font-size:16px;
            font-family:Georgia, 'Times New Roman', Times, serif;
            margin:0 0 0 10px;
        }

    </style>
    
    <script>
        /*JavaScript code to make sure only one box is checked at a time*/
        function selectOnlyOne(groupName, checkbox) {
            // Select all checkboxes with the same name (group) as the clicked checkbox
            var checkboxes = document.querySelectorAll(`input[name="${groupName}"]`);

            // Uncheck all other checkboxes in the same group except the one that was clicked
            checkboxes.forEach(function (cb) {
                if (cb !== checkbox) {
                    cb.checked = false;
                }
            });
        }
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <br />
    <h2>Evaluation Form for FYP</h2>


    <div class="container evaluation-form">
    <br />
    <!-- 1st criteria -->
    <p><strong>1. FYP Poster</strong></p>
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
                <input type="checkbox" id="point1Rating1" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating2" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating3" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating4" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating5" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating6" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating7" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating8" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating9" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point1Rating10" name="rating1" onclick="selectOnlyOne('rating1', this)">
            </div>
        </div>




    <br />
    <!-- 2nd criteria -->
    <p><strong>2. Iteration Definition, FYP Plan, Work Breakdown</strong></p>
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
                <input type="checkbox" id="point2Rating1" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating2" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating3" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating4" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating5" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating6" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating7" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating8" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating9" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point2Rating10" name="rating2" onclick="selectOnlyOne('rating2', this)">
            </div>
        </div>





    <br />
    <!-- 3rd criteria -->
    <p><strong>3. Work completed for the iteration(s) inclusing design and implementation</strong></p>
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
                <input type="checkbox" id="point3Rating1" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating2" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating3" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating4" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating5" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating6" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating7" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating8" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating9" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point3Rating10" name="rating3" onclick="selectOnlyOne('rating3', this)">
            </div>
        </div>





        <br />
    <!-- 4th criteria -->
    <p><strong>4. Slide Design and Content Quality</strong></p>
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
                <input type="checkbox" id="point4Rating1" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating2" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating3" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating4" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating5" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating6" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating7" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating8" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating9" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point4Rating10" name="rating4" onclick="selectOnlyOne('rating4', this)">
            </div>
        </div>





        <br />
    <!-- 2nd criteria -->
    <p><strong>5. Style (Delivery, Confidence, Clarity)</strong></p>
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
                <input type="checkbox" id="point5Rating1" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating2" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating3" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating4" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating5" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating6" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating7" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating8" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating9" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point5Rating10" name="rating5" onclick="selectOnlyOne('rating5', this)">
            </div>
        </div>





        <br />
    <!-- 6th criteria -->
    <p><strong>6. Clarity of Project Scope</strong></p>
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
                <input type="checkbox" id="point6Rating1" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating2" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating3" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating4" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating5" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating6" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating7" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating8" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating9" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
            <div class="item">
                <input type="checkbox" id="point6Rating10" name="rating6" onclick="selectOnlyOne('rating6', this)">
            </div>
        </div>

        <br />
        <!-- 7th criteria -->
        <p><strong>7. Definition of Project Features</strong></p>
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
                    <input type="checkbox" id="point7Rating1" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating2" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating3" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating4" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating5" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating6" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating7" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating8" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating9" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point7Rating10" name="rating7" onclick="selectOnlyOne('rating7', this)">
                </div>
            </div>




        <br />
        <!-- 8th criteria -->
        <p><strong>8. Team Dynamics (Coordination among team members)</strong></p>
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
                    <input type="checkbox" id="point8Rating1" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating2" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating3" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating4" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating5" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating6" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating7" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating8" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating9" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point8Rating10" name="rating8" onclick="selectOnlyOne('rating8', this)">
                </div>
            </div>



            <br />
        <!-- 9th criteria -->
        <p><strong>9. Timing of Presentation</strong></p>
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
                    <input type="checkbox" id="point9Rating1" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating2" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating3" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating4" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating5" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating6" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating7" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating8" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating9" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point9Rating10" name="rating9" onclick="selectOnlyOne('rating9', this)">
                </div>
            </div>



            <br />
        <!-- 10th criteria -->
        <p><strong>10. Implementation Work Completion</strong></p>
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
                    <input type="checkbox" id="point10Rating1" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating2" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating3" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating4" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating5" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating6" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating7" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating8" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating9" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point10Rating10" name="rating10" onclick="selectOnlyOne('rating10', this)">
                </div>
            </div>






        <br />
            <!-- 11th criteria -->
        <p><strong>11. Overall work quality and impression</strong></p>
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
                    <input type="checkbox" id="point11Rating1" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating2" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating3" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating4" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating5" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating6" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating7" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating8" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating9" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point11Rating10" name="rating11" onclick="selectOnlyOne('rating11', this)">
                </div>
            </div>





        <br/>
            <!-- 12th criteria -->
        <p><strong>12. Code Quality</strong></p>
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
                    <input type="checkbox" id="point12Rating1" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating2" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating3" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating4" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating5" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating6" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating7" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating8" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating9" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point12Rating10" name="rating12" onclick="selectOnlyOne('rating12', this)">
                </div>
            </div>



        <br />
            <!-- 13th criteria -->
        <p><strong>13. Level of code integration</strong></p>
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
                    <input type="checkbox" id="point13Rating1" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating2" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating3" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating4" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating5" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating6" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating7" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating8" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating9" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point13Rating10" name="rating13" onclick="selectOnlyOne('rating13', this)">
                </div>
            </div>



        <br />
            <!-- 14th criteria -->
        <p><strong>14. Class Diagram/DFD (provided in the report) correctly maps to the Code Implemented</strong></p>
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
                    <input type="checkbox" id="point14Rating1" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating2" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating3" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating4" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating5" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating6" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating7" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating8" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating9" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point14Rating10" name="rating14" onclick="selectOnlyOne('rating14', this)">
                </div>
            </div>




        <br />
        <!-- 15th criteria -->
        <p><strong>15. Handling of Questions</strong></p>
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
                    <input type="checkbox" id="point15Rating1" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating2" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating3" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating4" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating5" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating6" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating7" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating8" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating9" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
                <div class="item">
                    <input type="checkbox" id="point15Rating10" name="rating15" onclick="selectOnlyOne('rating15', this)">
                </div>
            </div>
    </div>

    <br /><br />

    <p><strong>Reviews/Suggestions</strong></p>
    <asp:TextBox ID="reviewBox" runat="server" CssClass="review-box" TextMode="MultiLine" Placeholder="Enter review..."/>

    <br /><br /><br /><br /><br /><br />


</asp:Content>
