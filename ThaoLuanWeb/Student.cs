using System;

namespace ThaoLuanWeb
{
    [Serializable]
    public class Student
    {
        public int StudentID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string ImagePath { get; set; }

        public Student()
        {
        }
        public Student(int id, string name, string mail, string img)
        {
            StudentID = id;
            FullName = name;
            Email = mail;
            ImagePath = img;
        }
    }
}