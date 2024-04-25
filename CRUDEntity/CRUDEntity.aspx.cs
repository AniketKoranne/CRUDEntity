using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRUDEntity.Models;

namespace CRUDEntity
{
    public partial class CRUDEntity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //using (var dbContext = new LearningAKEntities1()) {
            //    var nextStudentIdResult = dbContext.GetNextStudentId().FirstOrDefault(); // Get the first (or default) element from the result

            //    if (nextStudentIdResult != null)
            //    {
            //        int? nextStudentId = nextStudentIdResult; // Retrieve the nullable integer value
            //        if (nextStudentId.HasValue)
            //        {
            //            txtStudentID.Text = nextStudentId.Value.ToString(); // Set the TextBox text to the next student ID
            //        }
            //        else
            //        {
            //            // Handle the case where the next student ID is null or not available
            //            txtStudentID.Text = "1"; // Set a default value
            //        }
            //    }
            //    else
            //    {
            //        // Handle the case where the result is null or empty
            //        // For example, display a default or error message
            //        txtStudentID.Text = "N/A"; // Set a default value
            //    }
            //}            
                if (!IsPostBack) { BindGridView(); SetNextStudentID();}
                
        }
        private void SetNextStudentID()
        {
            using (var dbContext = new LearningAKEntities1())
            {
                var nextStudentIdResult = dbContext.GetNextStudentId().FirstOrDefault(); // Get the first (or default) element from the result

                if (nextStudentIdResult != null)
                {
                    int? nextStudentId = nextStudentIdResult; // Retrieve the nullable integer value
                    if (nextStudentId.HasValue)
                    {
                        txtStudentID.Text = nextStudentId.Value.ToString(); // Set the TextBox text to the next student ID
                    }
                    else
                    {
                        // Handle the case where the next student ID is null or not available
                        txtStudentID.Text = "1"; // Set a default value
                    }
                }
                else
                {
                    // Handle the case where the result is null or empty
                    // For example, display a default or error message
                    txtStudentID.Text = "N/A"; // Set a default value
                }
            }
        }

        private void BindGridView()
        {
            using (var dbContext = new LearningAKEntities1())
            {
                var data = dbContext.StudentRecords.ToList();
                GridView2.DataSource = data;
                GridView2.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

            // Retrieve input values from form fields            
            int? id = null; // Assuming Student ID is nullable
            if (!string.IsNullOrEmpty(txtStudentID.Text))
            {
                id = int.Parse(txtStudentID.Text);
            }
            string firstName = txtFirstName.Text;
            string middleName = txtMiddleName.Text;
            string lastName = txtLastName.Text;
            string address = txtAddress.Text;
            string phone = txtPhone.Text;

            // Create a new instance of StudentRecord entity
            var newStudent = new StudentRecord
            {
                Student_ID = (int)id, // Assign the Student ID
                Student_FName = firstName,
                Student_MName = middleName,
                Student_LName = lastName,
                Student_Address = address,
                Student_Phone = phone
            };

            // Add the new student record to the DbSet
            using (var dbContext = new LearningAKEntities1())
            {
                dbContext.StudentRecords.Add(newStudent);
                dbContext.SaveChanges();
                SetNextStudentID();
            }

            // Refresh GridView to display the newly added record
            BindGridView();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Retrieve input values from form fields
            int id;
            if (!int.TryParse(txtStudentID.Text, out id))
            {
                // Handle invalid input
                return;
            }
            string firstName = txtFirstName.Text;
            string middleName = txtMiddleName.Text;
            string lastName = txtLastName.Text;
            string address = txtAddress.Text;
            string phone = txtPhone.Text;

            // Create a new instance of the LearningAKEntities1 DbContext
            using (var dbContext = new LearningAKEntities1())
            {
                // Retrieve the student record to update
                var studentToUpdate = dbContext.StudentRecords.Find(id);
                if (studentToUpdate == null)
                {
                    // Handle case where student record with given ID is not found
                    return;
                }

                // Update the properties of the student record
                studentToUpdate.Student_FName = firstName;
                studentToUpdate.Student_MName = middleName;
                studentToUpdate.Student_LName = lastName;
                studentToUpdate.Student_Address = address;
                studentToUpdate.Student_Phone = phone;

                // Save changes to the database
                dbContext.SaveChanges();
                SetNextStudentID();
            }

            // Refresh GridView to display the updated records
            BindGridView();
        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Retrieve input values from form fields
            int id;
            if (!int.TryParse(txtStudentID.Text, out id))
            {
                // Handle invalid input
                return;
            }

            // Create a new instance of the LearningAKEntities1 DbContext
            using (var dbContext = new LearningAKEntities1())
            {
                // Call the DeleteStudent function from the DbContext
                int result = dbContext.DeleteStudent(id);

                // Check if deletion was successful
                if (result > 0)
                {
                    // Deletion successful
                    // Refresh GridView to display the updated records
                    BindGridView();
                    SetNextStudentID();
                }
                else
                {
                    // Handle deletion failure
                    // This could happen if the student record with the given ID does not exist
                    // Add appropriate error handling logic here
                }
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // Retrieve the selected row
                GridView2.SelectedRowStyle.BackColor = System.Drawing.Color.Yellow;
                GridViewRow selectedRow = GridView2.SelectedRow;
                if (selectedRow != null)
                {
                    // Set the text of txtSID TextBox
                    txtStudentID.Text = "";
                    txtStudentID.Text = selectedRow.Cells[1].Text;
                    txtFirstName.Text = selectedRow.Cells[2].Text;
                    txtMiddleName.Text = selectedRow.Cells[3].Text;
                    txtLastName.Text = selectedRow.Cells[4].Text;
                    txtAddress.Text = selectedRow.Cells[5].Text;
                    txtPhone.Text = selectedRow.Cells[6].Text;
                    GridView2.AutoGenerateSelectButton = false;
                }
                // Perform operations on the selected row
                BindGridView();
                // Rebind GridView and add select button                         
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }
    }
}