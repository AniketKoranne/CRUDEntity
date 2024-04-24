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
            using (var dbContext = new LearningAKEntities1()) {
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
                if (!IsPostBack) { BindGridView(); }
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
            }

            // Refresh GridView to display the newly added record
            BindGridView();

        }
    }
}