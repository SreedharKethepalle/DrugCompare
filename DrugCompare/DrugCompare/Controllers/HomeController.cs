using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DrugCompare.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace DrugCompare.Controllers
{
    public class HomeController : Controller
    {
        string conn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();


        #region Login

        [HttpGet]
        public ActionResult Login()
        {
            return View(new Login());
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Login(Login login)
        {
            if (ModelState.IsValid)
            {
                login.UserID = validateLogin(login.UserName, login.Password);
                if (login.UserID != 0)
                    Session["User"] = login;
                else
                    ModelState.AddModelError("", "Please enter correct userName and Password");

                if (ModelState.IsValid)
                {
                    Session["Plans"] = getPlansList(2019);
                    return RedirectToAction("Dashboard", new { userId = login.UserID });
                }
                else
                    return View();
            }
            else
                return View();
        }

        private int validateLogin(string userName, string password)
        {
            int ret = 0;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_ValidateLoginUser]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserName", userName);
                    cmd.Parameters.AddWithValue("Password", password);

                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ret = (int)returnParameter.Value;
                }
            }
            return ret;
        }
        #endregion

        public ActionResult Dashboard(int userId)
        {

            List<PlansList> _planNames = new List<PlansList>();
            _planNames = (List<PlansList>)Session["Plans"];

            var _dashboard = getDashBoardDetails(userId);
            _dashboard.PlanLists = _planNames;

            return View(_dashboard);
        }

        public ActionResult PlanList()
        {
            var UserData = Session["User"] as Login;
            return RedirectToAction("Dashboard", new { userId = UserData.UserID });
        }

        private DashboardViewModel getDashBoardDetails(int userId)
        {
            DashboardViewModel _dashboard = new DashboardViewModel();
            DataSet ds = new DataSet();


            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_GetUserDetailsForDashboard]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                    con.Close();
                }
            }

            _dashboard = dashboardList(ds);


            return _dashboard;
        }

        private DashboardViewModel dashboardList(DataSet ds)
        {
            DashboardViewModel _dashboard = new DashboardViewModel();

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                _dashboard.SelectedPlanInfoVM = Common.ConvertToList<SelectedPlanInfo>(ds.Tables[0]);
            }

            if (ds != null && ds.Tables.Count > 1 && ds.Tables[1].Rows.Count > 0)
            {
                _dashboard.SelectedPrescriptionVM = Common.ConvertToList<SelectedPrescriptionViewModel>(ds.Tables[1]);
            }

            if (ds != null && ds.Tables.Count > 2 && ds.Tables[2].Rows.Count > 0)
            {
                _dashboard.SelectedProviderVM = Common.ConvertToList<SelectedProviderViewModel>(ds.Tables[2]);
            }

            if (ds != null && ds.Tables.Count > 3 && ds.Tables[3].Rows.Count > 0)
            {
                _dashboard.SelectedPharmacyVM = Common.ConvertToList<SelectedPharmacyViewModel>(ds.Tables[3]);
            }

            return _dashboard;
        }

        private List<PlansList> getPlansList(int planYear)
        {
            List<PlansList> _plansList = new List<PlansList>();
            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_GetPlansList]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PlanYear", planYear);

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                    con.Close();
                }
            }

            _plansList = Common.ConvertToList<PlansList>(ds.Tables[0]);

            return _plansList;
        }

        #region Add Prescription
        private DrugVM GetDrugs()
        {
            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    var User = Session["User"] as Login;
                    cmd.CommandText = "[dbo].[Sp_GetDrugs]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", User.UserID);

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                    con.Close();
                }
            }

            //var temp = DataTableToList(ds);

            return DataTableToList(ds);
        }

        private DrugVM DataTableToList(DataSet ds)
        {
            DrugVM drugVm = new DrugVM();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                drugVm.DrugInfo = Common.ConvertToList<DrugInfo>(ds.Tables[0]);
            }

            if(ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {
                ds.Tables[1].Columns["DrugID "].ColumnName = "DrugID";
                drugVm.DrugDosageInfo = Common.ConvertToList<DrugDosageInfo>(ds.Tables[1]);
            }

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
            {
                drugVm.DrugFrequencyInfo = Common.ConvertToList<DrugFrequencyInfo>(ds.Tables[2]);
            }

            return drugVm;
        }

        public ActionResult AddNewPrescription()
        {
            //ViewBag.HiddenDrugID = 0;
            var DrugVM = GetDrugs();
            return View(DrugVM);
        } 

        [HttpPost]
        public ActionResult HiddenDrugValue(int? s)
        {
            var DrugVM = GetDrugs();
            DrugVM.DrugDosageInfo = DrugVM.DrugDosageInfo.Where(x => x.DrugId == s).ToList();
            return PartialView("DosagePopUp", DrugVM);
        }

        #endregion
    }
}


//DashboardViewModel _dashboard = new DashboardViewModel
//{
//    UserPlansVM = new UserPlanViewModel { PlanId = 102, PlanName = "halla gilla plan" },
//    PrescriptionVM = new PrescriptionViewModel { DrugId = 101, DrugName = "Dolo", DoseId = 101, DoseageName = "Dolo - 650" },
//    ProviderVM = new ProviderViewModel { ProviderId = 101, ProviderName = "Shree Krishna Clinic" },
//    PharmacyVM = new PharmacyViewModel { PharmacyId = 101, PharmacyName = "Apollo Pharmacy" }
//};
