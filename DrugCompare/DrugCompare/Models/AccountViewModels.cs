using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DrugCompare.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class DashboardViewModel
    {
        public List<SelectedPlanInfo> SelectedPlanInfoVM { get; set; }
        public List<SelectedPrescriptionViewModel> SelectedPrescriptionVM { get; set; }
        public List<ProviderViewModel> SelectedProviderVM { get; set; }
        public List<PharmacyViewModel> SelectedPharmacyVM { get; set; }
        public List<PlansList> PlanListsVM { get; set; }
        public List<ProviderViewModel> ProviderListsVM { get; set; }
        public List<PharmacyViewModel> PharmacyListsVM { get; set; }


    }


    public class SelectedPrescriptionViewModel
    {
        public int DrugId { get; set; }
        public string DrugName { get; set; }
        public int DoseId { get; set; }
        public string DoseageName { get; set; }
        public int DrugQuantity { get; set; }
        public decimal DrugPrice { get; set; }

        public string FrequencyName { get; set; }


    }

    public class ProviderViewModel
    {
        public int ProviderId { get; set; }
        public string ProviderName { get; set; }
        public string ProviderAddress { get; set; }
        public long ProviderPhone { get; set; }
        public long ProviderExperience { get; set; }
    }

    public class PharmacyViewModel
    {
        public int PharmacyId { get; set; }
        public string PharmacyName { get; set; }
        public string PharmacyAddress { get; set; }
        public int PharmacyPhone { get; set; }

    }

    public class SelectedPlanInfo
    {
        public int PlanId { get; set; }
        public string PlanName { get; set; }
        public int PlanTypeId { get; set; }
        public string PlanTypeName { get; set; }
        public int PlanYear { get; set; }

    }

    public class PlansList
    {
        public int PlanId { get; set; }
        public string PlanName { get; set; }

    }

    public class Login
    {
        public int UserID { get; set; }

        [Required]
        [Display(Name = "User Name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }

    public class DrugInfo
    {
        public int DrugID { get; set; }

        public string DrugName { get; set; }

        public int PrimaryDrugId { get; set; }
    }

    public class DrugDosageInfo
    {
        public int DrugDoseId { get; set; }

        public int DrugId { get; set; }

        public string DosageName { get; set; }

        public decimal UnitCost { get; set; }

        public int HiddenDrugID { get; set; }
    }

    public class DrugFrequencyInfo
    {
        public int FrequencyId { get; set; }

        public string FrequencyName { get; set; }

        public int FrequencyDays { get; set; }
    }

    public class DrugVM
    {
        public List<DrugInfo> DrugInfo { get; set; }

        public List<DrugDosageInfo> DrugDosageInfo { get; set; }

        public List<DrugFrequencyInfo> DrugFrequencyInfo { get; set; }

    }
}
