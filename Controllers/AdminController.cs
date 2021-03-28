using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParlanceNet.Models;
using ParlanceNet.Models.ViewModels;
using ParlanceNet.Services;

namespace ParlanceNet.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private ParlanceDBEntities db = new ParlanceDBEntities();
        private UserService userService = new UserService();

        public ActionResult Index()
        {
            try
            {
                string name;
                if (Session["Username"] != null)
                {
                    name = Session["Username"].ToString();
                }
                else
                {
                    ViewBag.Error = "Session Timeout..";
                    return RedirectToAction("Login", "Account");
                }
                User user = db.User.Where(s => s.Username == name).FirstOrDefault();
                if (user != null)
                {
                    if (user.RoleId == 2)
                    {

                        GlobalViewModel model = new GlobalViewModel();

                        model.session = user;
                        model.allPost = db.Post.Select(s => s)
                            .OrderByDescending(s => s.CreatedOn).ToList();
                        return View("ManagePost",model);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    return RedirectToAction("Login", "Account");
                }
            }
            catch
            {
                return RedirectToAction("Login", "Account");
            }

        }

        public ActionResult DeletePost(int postid)////new
        {
            var post = db.Post.Where(s => s.ID == postid).FirstOrDefault();
            post.IsDeleted = true;
            
            db.SaveChanges();
            
            
            return RedirectToAction("Index");
        }
        public ActionResult RecoverPost(int postid)////new
        {
            var post = db.Post.Where(s => s.ID == postid).FirstOrDefault();
            post.IsDeleted = false;

            db.SaveChanges();

            //ViewBag.Message = "Post Recovered";
            return RedirectToAction("Index");
        }

        public ActionResult ManageUser()////new
        {
            try
            {
                string name;
                if (Session["Username"] != null)
                {
                    name = Session["Username"].ToString();
                }
                else
                {
                    ViewBag.Error = "Session Timeout..";
                    return RedirectToAction("Login", "Account");
                }
                User user = db.User.Where(s => s.Username == name).FirstOrDefault();
                if (user != null)
                {
                    if (user.RoleId == 2)
                    {

                        GlobalViewModel model = new GlobalViewModel();
                        model.session = user;
                        model.friends = db.User.Select(s=>s).ToList();
                        model.friendReqNotifications = userService.getUserOnlyReqFriends(user.ID);
                        model.egoFriends = userService.getEgoFriends(user.ID);
                        model.allPost = db.Post.Where(s => s.IsDeleted == false).Select(s => s)
                            .OrderByDescending(s => s.CreatedOn).ToList();
                       
                        model.session = user;
                        model.allPost = db.Post.Select(s => s)
                            .OrderByDescending(s => s.CreatedOn).ToList();
                        return View("ManageUser", model);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    return RedirectToAction("Login", "Account");
                }
            }
            catch
            {
                return RedirectToAction("Login", "Account");
            }

        }
        public ActionResult DeleteComment(int commentid)////new
        {
            var comment = db.Comment.Where(s => s.ID == commentid).FirstOrDefault();
            comment.IsDeleted = true;

            db.SaveChanges();

            //ViewBag.Message = "Comment Deleted.";
            return RedirectToAction("Index");
        }
        public ActionResult RecoverComment(int commentid)////new
        {
            var comment = db.Comment.Where(s => s.ID == commentid).FirstOrDefault();
            comment.IsDeleted = false;

            db.SaveChanges();

            //ViewBag.Message = "Comment Recovered.";
            return RedirectToAction("Index");
        }
       
        public ActionResult BanUser(int userid)//new
        {
            var user = db.User.Where(s => s.ID == userid).FirstOrDefault();
            user.IsDeleted = true;

            db.SaveChanges();

            //ViewBag.Message = "User Banned.";
            return RedirectToAction("ManageUser",ViewBag);
        }
        
        public ActionResult ActiveUser(int userid)//new
        {
            var user = db.User.Where(s => s.ID == userid).FirstOrDefault();
            user.IsDeleted = false;

            db.SaveChanges();

            //ViewBag.Message = "User Activated.";
            return RedirectToAction("ManageUser",ViewBag);
        }
    }
    }
