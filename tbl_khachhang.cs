//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebNC
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_khachhang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_khachhang()
        {
            this.tbl_donhang = new HashSet<tbl_donhang>();
        }
    
        public System.Guid id_khachhang { get; set; }
        public string c_tenkhachhang { get; set; }
        public string c_diachi { get; set; }
        public string c_sodienthoai { get; set; }
        public string c_email { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_donhang> tbl_donhang { get; set; }
    }
}
