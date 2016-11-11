using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pent
{
    public class pentagSQL
    {
        private bdSQL bd = new bdSQL();

        public string getMaxInpect(string con)
        {
            string query = "SELECT MAX(inspect_id) FROM tbl_inspect";
            string maxInsp = bd.getSingleValue(query, con);
            return maxInsp;
        }

        public string inspectHead(string formatID, string area, string areaF, string numEmpleados, string fecha, string recorrido, string username, string pID, string supervisor, string con)
        {
            string inspID = "";
            //string insp = getMaxInpect(con);

            //if (insp == "")
            //{
            //    inspID = 1;
            //}
            //else
            //{
            //    inspID = Convert.ToInt32(insp) + 1;
            //}

            string insertQuery = "INSERT INTO tbl_inspect (format_id, area_id, areaF_id, inspect_noEmp, inspect_date, inspect_start,inspect_recor, usr_username,p_id,sup_username) " +
                "VALUES ('" + formatID + "','" + area + "','" + areaF + "','" + numEmpleados + "','" + fecha + "','" + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss") + "','" + recorrido + "','" + username + "','"+pID+"','"+ supervisor + "')" +
                ";SELECT CAST(scope_identity() AS int)";
            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return inspID;
        }

        public int getAspect(string formatID, int aspectSec, string con)
        {
            string aspect = bd.getSingleValue("SELECT aspect_id FROM tbl_aspect WHERE format_id='" + formatID + "' AND aspect_sec='" + aspectSec + "'", con);

            if (aspect == "")
            {
                aspect = "0";
            }

            return Convert.ToInt32(aspect);
        }

        public void insrInspectDtl(string insID, string aspect, string cumple, string comment, string evidence, string con)
        {
            string query = "INSERT INTO tbl_inspectDtl (inspect_id,aspect_id,inspectDtl_satis,inspectDtl_obs,inspectDtl_evidence) " +
                "VALUES ('" + insID + "','" + aspect + "'," + cumple + ",'" + comment + "','" + evidence + "')";
            bd.ejecutarConsulta(query, con);
        }

        public int existeAspect(int inspectID, int aspect, string con)
        {
            int existeAspect = Convert.ToInt32(bd.getSingleValue("SELECT COUNT(inspectDtl_id) FROM tbl_inspectDtl" +
                " WHERE inspect_id='" + inspectID + "' AND aspect_id='" + aspect + "'", con));

            return existeAspect;
        }

        public void guardaQuest(int inspectID, int aspect, bool satisf, string con)
        {
            string updateQuery = "UPDATE tbl_inspectDtl SET inspectDtl_satis='" + satisf + "', inspectDtl_obs='' WHERE inspect_id='" + inspectID + "' AND aspect_id='" + aspect + "'";
            bd.ejecutarConsulta(updateQuery, con);
        }

        public string generaActionPlan(string folio, int proceso, string con)
        {
            string strplanID = bd.getSingleValue("SELECT MAX(actPlan_id) FROM tbl_actionPlan", con);
            if (strplanID == "")
            {
                strplanID = "0";
            }
            int planID = Convert.ToInt32(strplanID) + 1;

            string insertQuery = "INSERT INTO tbl_actionPlan (actPlan_id,proc_id,key1) VALUES ('" + planID + "','" + proceso + "','" + folio + "');SELECT CAST(scope_identity() AS int)";
            string actPl = bd.ejecutarConsulta2(insertQuery, con);

            strplanID = Convert.ToString(Convert.ToInt32(strplanID) + 1);

            return strplanID;
        }
        //*** Generar acciones correctivas para insvestigacion de incidentes, inspecciones, etc.
        public string generaAction(string actTypeID, string actions, string ctrlTypeID, string evActDate, string statID, string incidentID, string actPlanID, string user_username, string key1, string con)
        {
            string srtInsert = "INSERT INTO tbl_eventActions(actType_id, evAction_actions, crtlType_id, evAction_date,stat_id, incident_id, actPlan_id, usr_username, key1) "+
                " VALUES ('"+ actTypeID + "','"+ ctrlTypeID + "','"+ evActDate + "','"+ statID + "','"+ incidentID + "','" + actPlanID + "','"+ user_username + "','"+ key1 + "')" +
                ";SELECT CAST(scope_identity() AS int)";

            string actionID = bd.ejecutarConsulta2(srtInsert, con);

            return actionID;
        }
        //*** Actualizar la inspección 
        public void updateInspectHead(string endDate, string inspectID,string con)
        {
            string srtUpdate = "UPDATE tbl_inspect SET inspect_end='"+ endDate + "', stat_id='6' WHERE inspect_id='"+inspectID+"'";

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }
        //*** para cerrar la inspección una vez que se ha realizado
        public void updateProgramInspect(string endDate, string pID, string con)
        {
            string srtUpdate = "UPDATE tbl_program SET p_endDate='" + endDate + "', p_active='0' WHERE p_id='"+pID+"'";

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }
        //*** ingresar nuevas acciones a la bitacora
        public void insertBitacora(string bitacDate, string bitacAction, string bitacDesc, string bitacModule, string bitacKey1, string bitacKey2, string user, string approved, string con)
        {
            string srtInsert = "INSERT INTO tbl_bitacora (bitac_date,bitac_action,bitac_desc,bitac_module,bitac_key1,bitac_key2,usr_username, bitac_approved) "+
                " VALUES ('"+ bitacDate + "','"+ bitacAction + "','"+ bitacDesc + "','"+ bitacModule + "','"+ bitacKey1 + "','"+ bitacKey2 +"','"+ user + "','"+approved+"')";

            bd.ejecutarConsulta2(srtInsert, con);
        }

        public DataTable generaAcciones(string folio, string actionPlan, string con)
        {
            string strElements = "SELECT inspect_id, inspectDtl_id, aspect_id, inspectDtl_satis, inspectDtl_obs FROM tbl_inspectDtl WHERE inspect_id='" + folio + "' AND inspectDtl_satis=0";
            DataTable acciones = bd.getTableData(strElements, con);

            foreach (DataRow row in acciones.Rows)
            {
                string insertQuery = "INSERT INTO tbl_eventActions (actType_id,crtlType_id,incident_id,actPlan_id,usr_username,key1)" +
                    " VALUES ('0','0','0'," + actionPlan + ",'','" + row[0].ToString() + "')";
                bd.ejecutarConsulta(insertQuery, con);
            }

            return acciones;
        }

        //-----------------------------------------
        //public DataTable generarInspDtl(string inspectID, string formatID, string con)
        //{
        //    string strElements = "SELECT aspect_id, format_id, aspect_id, aspect_sec FROM tbl_aspect WHERE format_id='" + formatID + "' AND aspect_active=1";
        //    DataTable acciones = bd.getTableData(strElements, con);

        //    foreach (DataRow row in acciones.Rows)
        //    {
        //        string insertQuery = "INSERT INTO tbl_eventActions (actType_id,crtlType_id,incident_id,actPlan_id,usr_username,key1)" +
        //            " VALUES ('0','0','0'," + actionPlan + ",'','" + row[1].ToString() + "')";
        //        bd.ejecutarConsulta(insertQuery, con);
        //    }

        //    return acciones;
        //}

        //Este sería el ejemplo para hacer una inserción y posteriormente se mande el ID.
        public string insertaProgram(string con)
        {
            string strInsProg = "INSERT INTO tbl_program (p_scheduleDay,p_active,p_date,format_id) VALUES ('2016-02-08','1','2016-02-08','1');SELECT CAST(scope_identity() AS int)";
            
            string strIDIns = bd.ejecutarConsulta2(strInsProg,con);
           
            return strIDIns;
        }
        public DataTable headerFormat(string formatID, string con)
        {
            string strSelect = " Select format_id, format_codigo, format_version, format_rev," +
                                " format_nextRev, format_name,format_norma " +
                                   " FROM tbl_formats " +
                                   " WHERE format_id = '" + formatID + "'";
            DataTable dtHeaderFormat = bd.getTableData(strSelect, con);

            return dtHeaderFormat;
        }
        public DataTable headInspeccion(string inspID, string con)
        {
            string strSelect = " Select tbl_areas.area_name, tbl_inspect.area_id, usrInfo_name ,inspect_noEmp,"+
                                " inspect_date, recor_desc ,inspect_start,inspect_end,recor_id " +
                                   " FROM tbl_inspect, tbl_recorType, tbl_areas, tbl_user, tbl_userInfo  " + 
                                   " WHERE tbl_inspect.inspect_recor = tbl_recorType.recor_id "+
                                   " AND tbl_inspect.area_id = tbl_areas.area_id " +
                                   " AND tbl_inspect.usr_username = tbl_user.usr_username " +
                                   " AND tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id " +
                                   " AND inspect_id = '" + inspID + "'";
            DataTable dtInspectHead = bd.getTableData(strSelect, con);

            return dtInspectHead;
        }
        public DataTable detalleInspeccion(string inspID,string con)
        {
            string strInspectDtl = "SELECT tbl_aspect.aspect_element, tbl_aspect.aspect_review, tbl_aspect.aspect_sec, "+
                " tbl_inspectDtl.inspectDtl_satis, tbl_inspectDtl.inspectDtl_obs "+
                " FROM tbl_aspect, tbl_inspectDtl " +
                " WHERE tbl_aspect.aspect_id = tbl_inspectDtl.aspect_id AND tbl_inspectDtl.inspect_id = " + 
                inspID + " ORDER BY aspect_sec";
            DataTable inspectDtl = bd.getTableData(strInspectDtl, con);

            return inspectDtl;
        }
        public DataTable listaAcciones(string key1, string procID,string con)
        {
            DataTable dt = new DataTable();
            string strSelect = "SELECT tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, "+
                " tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.actPlan_id, tbl_eventActions.key1, tbl_actionType.actType_desc, "+
                " tbl_controlType.ctrlType_desc, tbl_eventActions.stat_id,usr_username FROM tbl_eventActions INNER JOIN tbl_actionPlan ON " +
                " tbl_eventActions.actPlan_id = tbl_actionPlan.actPlan_id LEFT OUTER JOIN tbl_controlType ON tbl_eventActions.crtlType_id = tbl_controlType.ctrlType_id"+
                " LEFT OUTER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id WHERE (tbl_actionPlan.proc_id = "+procID+") AND (tbl_actionPlan.key1 = "+ key1 + ")";
            dt = bd.getTableData(strSelect,con);

            return dt;
        }
        public DataTable listaAcciones(string key1, string procID,string flag, string con)
        {
            DataTable dt = new DataTable();
            string strSelect = "SELECT        tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, "+
                         " tbl_eventActions.actPlan_id, tbl_eventActions.key1, tbl_actionType.actType_desc, tbl_controlType.ctrlType_desc, tbl_eventActions.stat_id, tbl_status.stat_desc, "+
                         " tbl_eventActions.usr_username, tbl_eventActions.evAction_fileEvidence, tbl_userInfo.usrInfo_name"+
                         " FROM tbl_actionType RIGHT OUTER JOIN"+
                         " tbl_eventActions INNER JOIN"+
                         " tbl_actionPlan ON tbl_eventActions.actPlan_id = tbl_actionPlan.actPlan_id INNER JOIN"+
                         " tbl_status ON tbl_eventActions.stat_id = tbl_status.stat_id " +
                         " INNER JOIN tbl_userInfo "+ 
                         " INNER JOIN tbl_user ON tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id ON tbl_eventActions.usr_username = tbl_user.usr_username LEFT OUTER JOIN "+
                         " tbl_controlType ON tbl_eventActions.crtlType_id = tbl_controlType.ctrlType_id ON tbl_actionType.actType_id = tbl_eventActions.actType_id "+
                    " WHERE(tbl_actionPlan.proc_id = '"+procID+"') AND(tbl_actionPlan.key1 = "+key1+")";
            dt = bd.getTableData(strSelect, con);

            return dt;
        }
        public string updateStatus(string status, string inspectID,string con)
        {
            string strInsProg = "UPDATE tbl_inspect SET stat_id='"+ status + "' WHERE inspect_id='"+ inspectID +"'";

            string strIDIns = bd.ejecutarConsulta2(strInsProg, con);

            return strIDIns;
        }
        public string getStatus(string key1, string table, string llave, string con)
        {
            string status = "";

            status = bd.getSingleValue("SELECT stat_id FROM "+ table +" WHERE "+  llave +" = '"+ key1 +"'",con);

            return status;
        }
        public string getSingleValueByID(string campo, string key1, string table, string llave, string con)
        {
            string valor ="";

            valor= bd.getSingleValue("SELECT " + campo + " FROM " + table + " WHERE " + llave + " = '" + key1 + "'", con);

            return valor;
        }
        public string getSupervByInspID(string campo, string key1, string table, string llave, string con)
        {
            string valor = "";

            valor = bd.getSingleValue("SELECT sup_username FROM tbl_inspect WHERE " + llave + " = '" + key1 + "'", con);

            return valor;
        }
        public string getFormatByInspectID(string inspectID, string con)
        {
            string formatCode = "";

            formatCode = bd.getSingleValue("SELECT format_codigo FROM tbl_inspect, tbl_formats WHERE tbl_inspect.format_id=tbl_formats.format_id AND inspect_id='"+inspectID+"'",con);

            return formatCode;
        }
        public DataTable getUsersByArea(string UsrId, string con)
        {
            DataTable dt = new DataTable();

            dt = bd.getTableData("select * from tbl_user  as usuario join tbl_userInfo as info  on usuario.usrInfo_id=info.usrInfo_id where usr_id=" + UsrId ,con);

            return dt;
        }
        public DataTable getUsersAndInfoById(string areaID, string con)
        {
            DataTable dt = new DataTable();

            dt = bd.getTableData("select * from tbl_user  as usuario join tbl_userInfo as info  on usuario.usrInfo_id=info.usrInfo_id where usr_id=" + areaID, con);

            return dt;
        }
        public DataTable getUserByUsername(string username,string con)
        {
            DataTable dt = new DataTable();

            dt = bd.getTableData("SELECT usrInfo_name, usrInfo_email FROM tbl_userInfo, tbl_user WHERE usr_username='" + username + "'", con);

            return dt;
        }
        public string getEmailByUserName(string username, string con)
        {
            string userMail = "";

            userMail = bd.getSingleValue("SELECT usrInfo_email FROM tbl_user, tbl_userInfo WHERE tbl_user.usrInfo_id=tbl_userInfo.usrInfo_id AND usr_username='" + username + "'", con);

            return userMail;
        }
        public DataTable getSignatures(string inspectID, string con)
        {
            DataTable dt = new DataTable();
            string strSelect="SELECT bitac_date, bitac_desc FROM tbl_bitacora WHERE bitac_key1 = '"+ inspectID + "' and bitac_module = 'inspects' AND bitac_approved = 1";
            dt = bd.getTableData(strSelect, con);

            return dt;
        }
        /**
        Consultas para la sección de VOS
         **/
        public void insrVosDtl(string vId, string bId, string voId, string vdRetro, string comment, string con)
        {
            string query = "INSERT INTO tbl_vosdtl (v_id,b_id,vo_id,vd_retro,vd_commet) " +
                "VALUES (" + vId + "," + bId + "," + voId + "," + vdRetro+ ",'" + comment + "')";
            bd.ejecutarConsulta(query, con);
        }
        public string insrVos(string areaId, string vViewer, string vDate, string vpId, string vPlace, string con)
        {
            string query = "INSERT INTO tbl_vos (area_id,usr_id,v_date,vp_id,v_place) " +
                "VALUES (" + areaId + "," + vViewer + ",'" + vDate + "'," + vpId + ",'"+ vPlace + "');SELECT CAST(scope_identity() AS int)";
            string vId = bd.ejecutarConsulta2(query, con);

            return vId;
        }
         public string getUsersArea(int infoId, string con)
        {
            string res = bd.getSingleValue("select perArea_id from tbl_userInfo where usrInfo_id =" + infoId.ToString() , con);

            return res;
        }

        public string getUsersAreaDesc(string AreaID, string con)
        {
            string res = bd.getSingleValue("select area_name from tbl_areas where area_id =" + AreaID, con);

            return res;
        }

        public int getActionPlan(string process, string key1, string con)
        {
            string aspect = bd.getSingleValue("select actPlan_id from tbl_actionPlan where proc_id=" + process + " and key1=" + key1 , con);

            if (aspect == "")
            {
                aspect = "0";
            }

            return Convert.ToInt32(aspect);
        }

        #region usuario

        public void updateUsr(string Usrname, string Pass,string rol, string activo, string usrID , string con)
        {
            string srtUpdate = "update tbl_user set usr_username='" + Usrname+ "', usr_pass='" +Pass+ "', rol_id="+rol+ ", usr_active="+ activo + " where usr_id="+ usrID;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public void updateUsrDtl(string Name, string email, string Company,string PerArea, string area,  string UsrInfoId, string con)
        {
            string srtUpdate = "update tbl_userInfo set usrInfo_name='" + Name + "', usrInfo_email='"+email+ "', usrInfo_company='"+ Company+ "', perArea_id=" + PerArea + ", area_id= " + area+ " where usrInfo_id="+UsrInfoId;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public int InsertUser(string Usrname, string Pass, string rol, string activo, string usrInfoId, string con)
        {
            string inspID = "";

            string insertQuery = "insert into tbl_user (usr_username,usr_pass,rol_id,usrinfo_id,usr_lastAccess,usr_active,resp_id,usr_respUsername,sup_username) " +
                                          "values ('" + Usrname + "', '" + Pass + "'," + rol + ","+ usrInfoId + ",null" + ","+activo + ",null,null,null)"
                                          + ";SELECT CAST(scope_identity() AS int)";


            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return Convert.ToInt32(inspID);
        }


        public int InsertUsrDtl(string Name, string email, string Company, string PerArea, string area, string con)
        {
            string inspID = "";


            string insertQuery = "insert into tbl_userInfo(usrInfo_noEmpleado,usrInfo_name,usrInfo_email,usrInfo_company,usrInfo_enterDate ,usrInfo_antique,usrInfo_charge,perArea_id,area_id) " +
                                 "values(null, '" + Name + "', '" + email + "','" + Company + "', null, null, null ,"+ PerArea+","+area+");"
                                  + ";SELECT CAST(scope_identity() AS int)";
            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return  Convert.ToInt32(inspID);
        }

        public string getIDbyuser(string usrname, string con)
        {
            string res = bd.getSingleValue("select usr_id from tbl_user where usr_username='"+ usrname +"'", con);

            return res;
        }
        #endregion

        #region CatArea

        public void updateCatArea(string name, string activo, string areaId, string con)
        {
            string srtUpdate = "update tbl_areas set area_name = '"+ name + "', area_active ="+activo+ " where area_id ="+areaId;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public int InsertCatArea(string Name, string active, string con)
        {
            string inspID = "";


            string insertQuery = "INSERT INTO tbl_areas (area_name,area_active)"+
                "values('"+Name+ "',"+active+")"
                + ";SELECT CAST(scope_identity() AS int)";
            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return Convert.ToInt32(inspID);
        }


        #endregion

        #region CatAreaFisica
        public void updateCatAreaFisc(string name, string activo, string areaId,string areaF_id, string con)
        {
            string srtUpdate = "update tbl_areasFisicas set areaF_name='"+name+ "', areaF_active="+activo+ ", area_id="+areaId+ " where areaF_id="+areaF_id;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public int InsertCatAreaFisc(string Name, string active,string areaId, string con)
        {
            string inspID = "";


            string insertQuery = "insert into tbl_areasFisicas (areaF_name,areaF_active,area_id)" +
                                                        "values('"+Name+ "', "+active+", "+ areaId+")"
                                                        + ";SELECT CAST(scope_identity() AS int)";
            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return Convert.ToInt32(inspID);
        }

        #endregion

        #region Graficas
        public DataTable ObtenGraficaComportamientos(string FechaInicio, string FechaFin, string Area, string proceso , string con)
        {
            string strSelect = "select * from ObtenGrafica('"+ FechaInicio+ "','"+FechaFin+ "',"+ Area+","+proceso+")";
            DataTable dtInspectHead = bd.getTableData(strSelect, con);

            return dtInspectHead;
        }

        #endregion

        #region CatProcesos
        public void updateCatProceso(string desc, string activo, string areaId,string procesID, string con)
        {
            string srtUpdate = "update tbl_vosproc set vp_desc='"+desc+ "',vp_active="+activo+ ",area_id="+areaId+ " where vp_id="+procesID;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public string InsertCatProceso(string Name, string active, string areaId, string con)
        {
            string inspID = "insert into tbl_vosproc (vp_desc,vp_active,area_id) values('"+Name+ "', "+active+", "+areaId+")";


            string insertQuery = "";
            insertQuery = bd.ejecutarConsulta2(inspID, con);

            return inspID;
        }

        #endregion
        #region Behavior
        public void updateCatBehavior(string pregunta, string activo, string NoPregunta, string con)
        {
            string srtUpdate = "update tbl_behavior set b_name='"+pregunta+ "', b_active="+activo+ "where b_id="+NoPregunta;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public string InsertCatBehavior(string Name, string active, string NoProceso, string con)
        {
            string inspID = "insert into tbl_behavior (b_num,b_name,b_active,vp_id) values((select count(*)+1 from tbl_behavior where vp_id="+NoProceso+ "),'"+Name+ "',"+active+","+NoProceso+")";


            string insertQuery = "";
            insertQuery = bd.ejecutarConsulta2(inspID, con);

            return inspID;
        }

        #endregion
        #region Causas
        public void updateCatcausas(string desc, string activo, string idCausas, string con)
        {
            string srtUpdate = "update tbl_causes set cause_desc='"+desc+ "', cause_active="+activo+ " where cause_id="+idCausas;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public string InsertCatCatcausas(string desc, string active, string con)
        {
            string inspID = "";


            string insertQuery = "insert into tbl_causes (cause_desc,cause_active) values ('" + desc + "'," + active + ")";

            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return inspID;
        }

        #endregion


        #region Aspect
        public void updateCatAspect(string Elemento, string ElementoRev, string Activo, string AspectID, string con)
        {
            string srtUpdate = "update tbl_aspect set aspect_element='"+Elemento+ "s',aspect_review='"+ElementoRev+ "',aspect_active="+Activo+ " where aspect_id="+ AspectID;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public string InsertCatCatAspect(string formatoId, string AspElement,string AspRev, string AspActive, string con)
        {
            string inspID = "";


            string insertQuery = "insert into tbl_aspect(format_id,aspect_element,aspect_review,aspect_active,aspect_sec)"+
                                 "values("+formatoId+ ",'"+AspElement+ "','"+AspRev+ "',"+AspActive+","+ "(select COUNT(*)+1 from tbl_aspect where format_id="+formatoId+"))";

            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return inspID;
        }

        #endregion


        #region Formatoas
        public void updateCatFormats(string Codigo, string version, string revicion, string name, string norma,string formatId, string con)
        {
            string srtUpdate = "update tbl_formats set format_codigo='"+Codigo+ "',format_version="+version+ ",format_rev='"+revicion+ "', format_name='"+name+ "', format_norma='"+norma+ "' where format_id="+ formatId;

            string actionID = bd.ejecutarConsulta2(srtUpdate, con);
        }

        public string InsertCatFormat(string codigo,string Version,string formRev, string name, string norma, string con)
        {
            string inspID = "";


            string insertQuery = "insert into tbl_formats (format_codigo, format_version, format_rev, format_nextRev, format_name, format_norma)"+
                                                   "values('"+codigo+ "', "+Version+ ", '"+formRev+ "', null, '"+name+ "', '"+norma+ "' )";

            inspID = bd.ejecutarConsulta2(insertQuery, con);

            return inspID;
        }

        #endregion


    }

}

