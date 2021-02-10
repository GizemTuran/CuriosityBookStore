using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mvc_lesson2._1.Models;

namespace mvc_lesson2._1.Controllers
{
    public class HomeController : Controller
    {
        CuriosityBookStoreEntities3 db = new CuriosityBookStoreEntities3();

        [HttpPost]
        public ActionResult ForgotPassword(UserTable User)
        {
            string message = " ";
            bool status = false;

            var account = db.UserTable.Where(a => a.UserMail == User.UserMail).FirstOrDefault(); // to get all infos according to mail.
            if (account != null)
            {
                //send email for reset password
            }
            else
            {
                message = "Account is not found...";
            }

            return View();
        }
        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddNewBook(BooksTable newb)
        {
            var book = db.BooksTable.FirstOrDefault(s => s.BookName == newb.BookName && s.WritersNameSurname == newb.WritersNameSurname);
            if (book==null)
            {
                BooksTable book1 = new BooksTable()
                {
                    BookName = newb.BookName,
                    BookPrice = newb.BookPrice,
                    BookPhoto = newb.BookPhoto,
                    WritersNameSurname = newb.WritersNameSurname
                };

                db.BooksTable.Add(book1);
                db.SaveChanges();
            }
            else
            {
                ViewBag.BookError = "The book which you entered has already exist...";           
            }
           

            return View();
        }

        public ActionResult AddNewBook()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserTable model)
        {
            var user2 = db.UserTable.FirstOrDefault(s => s.UserMail == model.UserMail && s.UserPassword == model.UserPassword); //Select yazmaya gerek yok çünkü FirstOrDefault returnler.
            
            if (user2 != null)
            {
                Session.Add("username", user2.UserNickname);
                Session.Add("usermail", user2.UserMail);
                Session.Add("userp", user2.UserPassword);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.LoginError = "The user which you entered has already exist...";
            }

            return View(user2);
        }

        public ActionResult Login()
        {
     
            return View();
        }

        [HttpPost] //Butona basılınca çalışır ayrıca bilgiyi parametre olarak alır.
        public ActionResult SignUp(UserTable model)
        {
            UserTable user1 = new UserTable() {

            UserNickname = model.UserNickname,
            UserPassword=model.UserPassword,
            UserMail=model.UserMail
        };
            db.UserTable.Add(user1);//database'e bilgi ekleme
            db.SaveChanges();
            Session.Add("username", user1.UserNickname);
            Session.Add("usermail", user1.UserMail);
            Session.Add("userp", user1.UserPassword);

            return RedirectToAction("Index","Home",new {user1});
        }
        public ActionResult SignUp() //Siteye girince çalışır
        {
            return View();
        }
        public ActionResult Gallery()
        {
            var query = db.BooksTable.Where(s => s.ID > 0).Select(s => s); //where filtreler, select returnler.
            return View(query);
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}