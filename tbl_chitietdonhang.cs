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
    
    public partial class tbl_chitietdonhang
    {
        public System.Guid id_chitietdonhang { get; set; }
        public System.Guid fk_donhang { get; set; }
        public System.Guid fk_sanpham { get; set; }
        public int c_soluong { get; set; }
        public float c_dongia { get; set; }
        public float c_thanhtien { get; set; }
    
        public virtual tbl_donhang tbl_donhang { get; set; }
        public virtual tbl_sanpham tbl_sanpham { get; set; }
    }
}
