using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pent
{
    class Entidades
    {

    }
    public class DetalleVos
    {
        public string v_id { get; set; }
        public string vd_id { get; set; }
        public string b_id { get; set; }
        public string vo_id { get; set; }
        public string vd_comment { get; set; }
        public string vd_retro { get; set; }
    }


    public class Pregtunta
    {
        public string b_id { get; set; }
        public string b_num { get; set; }
        public string b_name { get; set; }
        public string b_active { get; set; }

    }

}
