
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.ComponentModel;
using System.Threading;
using System.IO.Ports;

using System.Data.SqlClient;

using EnergyManagement.RTU;

namespace EventRegistrationWeb
{
    public partial class ViewData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Timer1_Tick(object sender, EventArgs e)  //数据库方式  YYYY
        {
            SqlDataReader sdr = null;
            try
            {
                sdr = CommData.GetComData();
                while (/*sdr.Read()*/true)
                {
                    //lbLeftMachineSpeed.Text = sdr["左主机转速"].ToString();
                    //lbRightMachineSpeed.Text = sdr["右主机转速"].ToString();
                    //lbSailingSpeed.Text = sdr["航行速度"].ToString();
                    //lbLeftPushPower.Text = sdr["左推进功率"].ToString();
                    //lbRightPushPower.Text = sdr["右推进功率"].ToString();
                    //lbTotalDis.Text = sdr["累计距离"].ToString();
                    //lbFastOil.Text =sdr["全船瞬时油耗"].ToString();
                    //lbTotalOil.Text =sdr["全船累计油耗"].ToString();
                    //lbLeftFastOil.Text =sdr["左推瞬时油耗"].ToString();
                    //lbLeftTotalOil.Text = sdr["左推累计油耗"].ToString();
                    //lbRightFastOil.Text = sdr["右推瞬时油耗"].ToString();
                    //lbRightTotalOil.Text = sdr["右推累计油耗"].ToString();
                    //lbOtherFastOil.Text = sdr["其它瞬时油耗"].ToString();
                    //lbOtherTotalOil.Text = sdr["其它累计油耗"].ToString();
                    //lbDG1FastOil.Text = sdr["DG1瞬时油耗"].ToString();
                    //lbDG1TotalOil.Text =sdr["DG1累计油耗"].ToString();
                    //lbDG2FastOil.Text = sdr["DG2瞬时油耗"].ToString();
                    //lbDG2TotalOil.Text =sdr["DG2累计油耗"].ToString();
                    //lbDG3FastOil.Text =  sdr["DG3瞬时油耗"].ToString();
                    //lbDG3TotalOil.Text = sdr["DG3累计油耗"].ToString();
                    //lbDG4FastOil.Text =  sdr["DG4瞬时油耗"].ToString();
                    //lbDG4TotalOil.Text =sdr["DG4累计油耗"].ToString();
                    //lbLeftFastElect.Text = sdr["左推进瞬时耗电量"].ToString();
                    //lbLeftTotalElect.Text = sdr["左推进总耗电量"].ToString();
                    //lbRightFastElect.Text = sdr["右推进瞬时耗电量"].ToString();
                    //lbDG2TotalTime.Text = sdr["DG2运行时间"].ToString();
                    //lbDG2Voltage.Text = sdr["DG2电压"].ToString();
                    //lbDG2Current.Text = sdr["DG2电流"].ToString();
                    //lbDG2Power.Text = sdr["DG2功率"].ToString();

                    //lbDG3TotalTime.Text = sdr["DG3运行时间"].ToString();
                    //lbDG3Voltage.Text = sdr["DG3电压"].ToString();
                    //lbDG3Current.Text = sdr["DG3电流"].ToString();
                    //lbDG3Power.Text = sdr["DG3功率"].ToString();

                    //lbDG4TotalTime.Text = sdr["DG4运行时间"].ToString();
                    //lbDG4Voltage.Text = sdr["DG4电压"].ToString();
                    //lbDG4Current.Text = sdr["DG4电流"].ToString();
                    //lbDG4Power.Text = sdr["DG4功率"].ToString();           

                    //lbRightTotalElect.Text = sdr["右推进总耗电量"].ToString();
                    //lbOtherFastElect.Text = sdr["其它瞬时耗电量"].ToString();
                    //lbOtherTotalElect.Text = sdr["其它瞬总耗电量"].ToString();
                    //lbEEOI.Text = sdr["EEOI"].ToString();

                    //lbDG1TotalTime.Text = sdr["DG1运行时间"].ToString();
                    //lbDG1Voltage.Text = sdr["DG1电压"].ToString();
                    //lbDG1Current.Text = sdr["DG1电流"].ToString();
                    //lbDG1Power.Text = sdr["DG1功率"].ToString();
                    /////
                    //lbMAVoltage.Text = sdr["MA电压"].ToString();
                    //lbMBVoltage.Text = sdr["MB电压"].ToString();

                    //lbNO1CapacitiveState.Text = sdr["电容1"].ToString();
                    //lbNO1Voltage.Text = sdr["电压1"].ToString();
                    //lbNO2CapacitiveState.Text = sdr["电容2"].ToString();
                    //lbNO2Voltage.Text = sdr["电压2"].ToString();

                    //lbLeftMachAdviceSpeed.Text = sdr["左主机建议转速"].ToString();
                    //lbRMachAdviceSpeed.Text = sdr["右主机建议转速"].ToString();
                    //lbAdviceCounts.Text = sdr["建议数量"].ToString();
                    //lbAdviceDG1Power.Text = sdr["DG1建议功率"].ToString();
                    //lbAdviceDG2Power.Text = sdr["DG2建议功率"].ToString();
                    //lbAdviceDG3Power.Text = sdr["DG3建议功率"].ToString();
                    //lbAdviceDG4Power.Text = sdr["DG4建议功率"].ToString();

                    //lbWindSpeed.Text = sdr["风速"].ToString();
                    //lbWindDegrees.Text = sdr["风向"].ToString();
                    //lbWaterDepth.Text = sdr["水深"].ToString();
                    //lbvelocitySpeed.Text = sdr["流速"].ToString();

                    ////实时当前坐标值(114.912129, 22.512642);
                    lbLongitude.Text = /*sdr["实时坐标纬度"].ToString()*/"114.712129";
                    lbLatitude.Text = /*sdr["实时坐标经度"].ToString()*/"22.512642";

                    //始点位置(114.712129, 22.512642);
                    lbOriLatitudeDeg.Text =/* sdr["起时坐标经度度"].ToString()*/"22";
                    lbOriLatitudeScore.Text = /*sdr["起时坐标经度分"].ToString()*/"512642";

                    lbOriLongitudeDeg.Text = /*sdr["起时坐标纬度度"].ToString()*/"114";
                    lbOriLongitudeScore.Text = /*sdr["起时坐标纬度分"].ToString()*/"912129";

                    //终点位置(113.92983, 22.509397)
                    lbEndLatitudeDeg.Text = /*sdr["终点坐标经度度"].ToString()*/"22";
                    lbEndLatitudeScore.Text = /*sdr["终点坐标经度分"].ToString()*/"509397";
                   // lbLongitude.Text = lbEndLongitudeDeg.Text + " :  " + lbEndLongitudeScore.Text;

                    lbEndLongitudeDeg.Text = /*sdr["终点坐标纬度度"].ToString()*/"113"; 
                    lbEndLongitudeScore.Text = /*sdr["终点坐标纬度分"].ToString()*/"92983";

                    //船胉吃水
                    /*lbDraft.Text = sdr["船舶吃水"].ToString();
                    //总载量
                    lbTotalPeople.Text = sdr["总载客量"].ToString();
                    //燃油类型
                    lbFuelType.Text = sdr["燃油类型"].ToString();
                    //密度
                    lbDensity.Text = sdr["燃油密度"].ToString();
                    //起时地点
                    lbOriLongitude.Text = lbOriLongitudeDeg.Text + "°" + lbOriLongitudeScore.Text + "′";
                    lbOriLatitude.Text = lbOriLatitudeDeg.Text + "°" + lbOriLatitudeScore.Text + "′";
                    lbOriName.Text = sdr["出发地点"].ToString();
                    //终点
                    lbEndLongitude.Text = lbEndLongitudeDeg.Text + "°" + lbEndLongitudeScore.Text + "′";
                    lbEndLatitude.Text = lbEndLatitudeDeg.Text + "°" + lbEndLatitudeScore.Text + "′";
                    lbEndName.Text = sdr["到达地点"].ToString();
                    lbAimTime.Text = sdr["到达时间"].ToString();*/


                    //  sdr.Close();
                    break;
                }
            }
            catch
            {

            }
            //sdr.Close();
        }
    }
}
          
            
      

