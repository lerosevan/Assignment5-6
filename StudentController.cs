using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic; // Required for IEnumerable and List

namespace serviceRest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<Student> GetStudentName()
        {
            return new List<Student>
            {
                new Student
                {
                    Id = 123,
                    StudentName = "James"
                },
                new Student
                {
                    Id = 124,
                    StudentName = "Jill"
                }
            };
        }
    }

    public class Student
    {
        public int Id { get; set; } // Corrected set syntax
        public string StudentName { get; set; } // Corrected set syntax
    }
}
