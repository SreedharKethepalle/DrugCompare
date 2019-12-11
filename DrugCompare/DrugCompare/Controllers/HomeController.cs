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

        public ActionResult Dashboard(int userId = 0)
        {
            Session["Plans"] = getPlansList(2019);

            List<PlansList> _planNames = new List<PlansList>();
            _planNames = (List<PlansList>)Session["Plans"];

            var _dashboard = getDashBoardDetails(userId);
            _dashboard.PlanLists = _planNames;

            return View(_dashboard);
        }

        public ActionResult PlanList()
        {
            return RedirectToAction("Dashboard", new { userId = 100 });
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
                List<SelectedPlanInfo> _UserSelectedPlans = new List<SelectedPlanInfo>();
                _dashboard.SelectedPlanInfoVM = Common.ConvertToList<SelectedPlanInfo>(ds.Tables[0]); 
            }

            if (ds != null && ds.Tables.Count > 1 && ds.Tables[1].Rows.Count > 0)
            {
                List<SelectedPrescriptionViewModel> _Prescriptionn = new List<SelectedPrescriptionViewModel>();
                _dashboard.SelectedPrescriptionVM = Common.ConvertToList<SelectedPrescriptionViewModel>(ds.Tables[1]); 
            }

            if (ds != null && ds.Tables.Count > 2 && ds.Tables[2].Rows.Count > 0)
            {
                List<SelectedProviderViewModel> _Provider = new List<SelectedProviderViewModel>();
                _dashboard.SelectedProviderVM = Common.ConvertToList<SelectedProviderViewModel>(ds.Tables[2]);
            }

            if (ds != null && ds.Tables.Count > 3 && ds.Tables[3].Rows.Count > 0)
            {
                List<SelectedPharmacyViewModel> _Pharmacy = new List<SelectedPharmacyViewModel>();
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
    }
}


//DashboardViewModel _dashboard = new DashboardViewModel
//{
//    UserPlansVM = new UserPlanViewModel { PlanId = 102, PlanName = "halla gilla plan" },
//    PrescriptionVM = new PrescriptionViewModel { DrugId = 101, DrugName = "Dolo", DoseId = 101, DoseageName = "Dolo - 650" },
//    ProviderVM = new ProviderViewModel { ProviderId = 101, ProviderName = "Shree Krishna Clinic" },
//    PharmacyVM = new PharmacyViewModel { PharmacyId = 101, PharmacyName = "Apollo Pharmacy" }
//};
