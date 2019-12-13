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
                    Session["Providers"] = getProvidersList();
                    return RedirectToAction("Dashboard");
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

        public ActionResult Dashboard()
        {
            var _login = (Login)Session["User"];

            List<PlansList> _planNames = new List<PlansList>();
            _planNames = (List<PlansList>)Session["Plans"];

            List<SelectedProviderViewModel> _providerNames = new List<SelectedProviderViewModel>();
            _providerNames = (List<SelectedProviderViewModel>)Session["Providers"];


            var _dashboard = getDashBoardDetails(_login.UserID);
            _dashboard.PlanListsVM = _planNames;
            _dashboard.ProviderListsVM = _providerNames;

            return View(_dashboard);
        }

        [HttpPost]
        public ActionResult PlanList(int SelectedPlanId)
        {
            var _login = (Login)Session["User"];
            var _status = UpdatePlansForUser(_login.UserID, SelectedPlanId);
            return RedirectToAction("Dashboard");
        }

        [HttpPost]
        public ActionResult ProvidersList(int SelectedProviderId)
        {
            var _login = (Login)Session["User"];
            var _status = UpdateProvidersForUser(_login.UserID, SelectedProviderId);
            return RedirectToAction("Dashboard");
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


        private List<SelectedProviderViewModel> getProvidersList()
        {
            List<SelectedProviderViewModel> _providersList = new List<SelectedProviderViewModel>();
            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_GetProvidersList]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@PlanYear", planYear);

                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);

                    con.Close();
                }
            }

            _providersList = Common.ConvertToList<SelectedProviderViewModel>(ds.Tables[0]);

            return _providersList;
        }

        private int UpdatePlansForUser(int userId, int planId)
        {
            int ret = 0;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_UpdatePlansForUser]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserId", userId);
                    cmd.Parameters.AddWithValue("PlanId", planId);

                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ret = (int)returnParameter.Value;
                }
            }
            return ret;
        }

        private int UpdateProvidersForUser(int userId, int providerId)
        {
            int ret = 0;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_UpdateProviderForUser]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserId", userId);
                    cmd.Parameters.AddWithValue("ProviderId", providerId);

                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ret = (int)returnParameter.Value;
                }
            }
            return ret;
        }

        #region Add or delete Prescription

        #region AddPrescription Db Calls
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

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
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

        private void saveDrug(int doasgeInfoVal, int frequencyIdVal, int quantityVal, int userID)
        {
            int ret = 0;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_AddingNewDrug]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserId", userID);
                    cmd.Parameters.AddWithValue("DosageID", doasgeInfoVal);
                    cmd.Parameters.AddWithValue("Quantity", quantityVal);
                    cmd.Parameters.AddWithValue("FrequencyID", frequencyIdVal);

                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ret = (int)returnParameter.Value;
                }
            }
        }

        private void Delete(int? drugID,int userID)
        {
            int ret = 0;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {

                    cmd.CommandText = "[dbo].[Sp_DeleteDrug]";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserId", userID);
                    cmd.Parameters.AddWithValue("DrugID", drugID);

                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    ret = (int)returnParameter.Value;
                }
            }
            //return ret;
        }
        #endregion

        public ActionResult AddNewPrescription()
        {
            //ViewBag.HiddenDrugID = 0;
            var DrugVM = GetDrugs();
            return View(DrugVM);
        }

        [HttpPost]
        public ActionResult PopupData(int? drugValue)
        {
            var DrugVM = GetDrugs();
            DrugVM.DrugDosageInfo = DrugVM.DrugDosageInfo.Where(x => x.DrugId == drugValue).ToList();
            return PartialView("DosagePopUp", DrugVM);
        }

        [HttpPost]
        public ActionResult SaveDrugInfo(int DoasgeInfoVal, int FrequencyIdVal, int QuantityVal)
        {
            var User = Session["User"] as Login;
            saveDrug(DoasgeInfoVal, FrequencyIdVal, QuantityVal, User.UserID);
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteDrug(int? DrugId)
        {
            var User = Session["User"] as Login;
            Delete(DrugId, User.UserID);

            return RedirectToAction("DashBoard");
        }

        #endregion
    }
}