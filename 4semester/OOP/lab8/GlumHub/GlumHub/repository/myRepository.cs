using Microsoft.Data.SqlClient;
using System;
using System.CodeDom;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.RightsManagement;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace GlumHub
{
    internal class myRepository
    {

        string connectionString;

        private static myRepository repository;

        public static myRepository GetRepository()
        {
            if (repository == null)
                repository = new myRepository();
            return repository;
                
        }

        public myRepository()
        {
            connectionString = ConfigurationManager.ConnectionStrings["myContext"].ConnectionString;
            if (!DoesTableExist("Students"))
            {
                CreateDatabaseTable("Students");
            }

            if (!DoesTableExist("Addr"))
            {
                CreateDatabaseTable("Addr");
            }
        }


        public bool DoesTableExist(string tableName)
        {
            bool tableExists = false;

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName";

                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@TableName", tableName);
                    int count = (int)command.ExecuteScalar();

                    tableExists = (count > 0);
                }
            }

            return tableExists;
        }


        public void CreateDatabaseTable(string tableName)
        {
            string createTableQuery;

            if(tableName == "Students")
                createTableQuery = $"CREATE TABLE Students " +
                    $"(Id BIGING PRIMARY KEY, ProfileImage BINSRY(MAX), FIO NVARCHAR(MAX), Age INT)";
            else
                createTableQuery = $"CREATE TABLE Addr " +
                    $"(Id BIGINT PRIMARY KEY, UserId BIGING FOREIGN KEY REFERENCES Students(Id)," +
                    $" City NVARCHAR(MAX), Street NVARCHAR(MAX), Home INT)";

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (var command = new SqlCommand(createTableQuery, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }


        public Student findStudentById(long id)
        {
            Student student = new Student();
            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string sqlQuery = "SELECT s.Id, s.ProfileImage, s.FIO, s.Age, a.City, a.Street, a.Home, a.Id\r\n\tFROM Students s INNER JOIN Addr a\r\n\tON s.Id = a.StudentId WHERE s.Id = @Id";
                    
                    using(SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("Id", id);

                        using(SqlDataReader reader = command.ExecuteReader())
                        {
                            reader.Read();
                            student.Id = reader.GetInt64(0);
                            if (!reader.IsDBNull(1)) // Проверка на NULL
                            {
                                long imageSize = reader.GetBytes(1, 0, null, 0, 0); // Получаем размер бинарных данных
                                byte[] buffer = new byte[imageSize];
                                reader.GetBytes(1, 0, buffer, 0, (int)imageSize); // Чтение бинарных данных (изображения) в буфер

                                student.ProfileImage = buffer; // Устанавливаем изображение студента
                            }
                            student.FIO = reader.GetString(2);
                            student.Age = reader.GetInt32(3);
                            student.Address = new Address();
                            student.Address.City = reader.GetString(4);
                            student.Address.Street = reader.GetString(5);
                            student.Address.Homme = reader.GetInt32(6);
                            student.Address.Id = reader.GetInt64(7);
                            student.Address.StudentId = reader.GetInt64(0);
                        }
                    }

                }catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            return student;
        }

        public List<Student> findAllStudents()
        {
            List<Student> result = new List<Student>();
            using(SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    using(SqlCommand command = new SqlCommand("GetStudents", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        using(SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Student student = new Student();
                                student.Id = reader.GetInt64(0);
                                if (!reader.IsDBNull(1)) // Проверка на NULL
                                {
                                    long imageSize = reader.GetBytes(1, 0, null, 0, 0); // Получаем размер бинарных данных
                                    byte[] buffer = new byte[imageSize];
                                    reader.GetBytes(1, 0, buffer, 0, (int)imageSize); // Чтение бинарных данных (изображения) в буфер

                                    student.ProfileImage = buffer; // Устанавливаем изображение студента
                                }
                                student.FIO = reader.GetString(2);
                                student.Age = reader.GetInt32(3);
                                student.Address = new Address();
                                student.Address.City = reader.GetString(4);
                                student.Address.Street = reader.GetString(5);
                                student.Address.Homme = reader.GetInt32(6);
                                student.Address.Id = reader.GetInt64(7);
                                student.Address.StudentId = reader.GetInt64(0);
                                result.Add(student);
                            }
                        }
                    }
                }catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            return result;
        }


        public void DeleteStudentById(long? studentId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = null;

                try
                {
                    transaction = connection.BeginTransaction();

                    string deleteAddressQuery = "DELETE FROM Addr WHERE StudentId = @StudentId";
                    using (SqlCommand addressCommand = new SqlCommand(deleteAddressQuery, connection, transaction))
                    {
                        addressCommand.Parameters.AddWithValue("@StudentId", studentId);

                        int addressRowsAffected = addressCommand.ExecuteNonQuery();

                        if (addressRowsAffected == 0)
                        {
                            throw new Exception($"Адрес с UserId {studentId} не найден.");
                        }
                    }

                    string deleteStudentQuery = "DELETE FROM Students WHERE Id = @StudentId";
                    using (SqlCommand studentCommand = new SqlCommand(deleteStudentQuery, connection, transaction))
                    {
                        studentCommand.Parameters.AddWithValue("@StudentId", studentId);

                        int studentRowsAffected = studentCommand.ExecuteNonQuery();

                        if (studentRowsAffected == 0)
                        {
                            throw new Exception($"Студент с Id {studentId} не найден.");
                        }
                    }

                    transaction.Commit();

                    MessageBox.Show($"Студент с Id {studentId} успешно удален.");
                }
                catch (Exception ex)
                {
                    transaction?.Rollback();

                    MessageBox.Show($"Ошибка при удалении студента: {ex.Message}");
                }
            }
        }


        public void AddNewStudent(Student student)
        {
            Decimal newStudentId;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string sqlQuery = @"
                INSERT INTO Students (ProfileImage, FIO, Age)
                VALUES (@ProfileImage, @FIO, @Age);
                SELECT SCOPE_IDENTITY();";

                    using(SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("ProfileImage", student.ProfileImage);
                        command.Parameters.AddWithValue("FIO", student.FIO);
                        command.Parameters.AddWithValue("Age", student.Age);

                        newStudentId = (Decimal)command.ExecuteScalar();
                        student.Id = (long)newStudentId;
                    }
                    MessageBox.Show("Новый студент успешно добавлен.");
                    sqlQuery = @"
                INSERT INTO Addr (StudentId, City, Street, Home)
                VALUES (@StudentId, @City, @Street, @Home);";

                    using(SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("StudentId", student.Id);
                        command.Parameters.AddWithValue("City", student.Address.City);
                        command.Parameters.AddWithValue("Street", student.Address.Street);
                        command.Parameters.AddWithValue("Home", student.Address.Homme);

                        command.ExecuteScalar();
                    }
                    MessageBox.Show("Новый адрес успешно добавлен.");

                }catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        public void UpdateStudent(Student student)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string sqlQuery = @"
                UPDATE Students
                SET ProfileImage = @ProfileImage,
                    FIO = @FIO,
                    Age = @Age
                WHERE Id = @StudentId";

                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("@ProfileImage", student.ProfileImage);
                        command.Parameters.AddWithValue("@FIO", student.FIO);
                        command.Parameters.AddWithValue("@Age", student.Age);
                        command.Parameters.AddWithValue("@StudentId", student.Id);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Данные студента успешно обновлены.");
                        }
                        else
                        {
                            MessageBox.Show("Студент с указанным Id не найден.");
                        }
                    }

                    sqlQuery = @"
                UPDATE Addr
                SET City = @City,
                    Street = @Street,
                    Home = @Home
                WHERE StudentId = @StudentId";

                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        command.Parameters.AddWithValue("@City", student.Address.City);
                        command.Parameters.AddWithValue("@Street", student.Address.Street);
                        command.Parameters.AddWithValue("@Home", student.Address.Homme);
                        command.Parameters.AddWithValue("@StudentId", student.Id);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Адрес студента успешно обновлен.");
                        }
                        else
                        {
                            MessageBox.Show("Адрес студента не найден для указанного Id.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при обновлении данных студента: {ex.Message}");
                }
            }
        }



    }
}
