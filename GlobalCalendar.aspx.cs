using System;

using Pelesys.Common;
using Pelesys.Web;
using DayPilot.Utils;
using DayPilot.Web.Ui.Events;
using DayPilot.Web.Ui.Events.Bubble;
using System.Data;



using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Enums;


namespace Pelesys.Scheduling.Web.Files
{
    public partial class GlobalCalendar : PageBase
    {
        private DataTable table;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.PageTitle = GetString("Page_GlobalCalendarTitle", "Global Calendar");


            initData();

            DayPilotScheduler1.StartDate = new DateTime(DateTime.Today.Year, 1, 1);
            DayPilotScheduler1.Days = Year.Days(DateTime.Today.Year);
            DayPilotScheduler1.Separators.Add(DateTime.Today, Color.Red);

            if (!IsPostBack)
            {
                DayPilotScheduler1.SetScrollX(DateTime.Today);
                //DayPilotScheduler1.ScrollY = 10;
                setDataSourceAndBind();
            }
        }


        private void setDataSourceAndBind()
        {
            // ensure that filter is loaded
            string filter = (string)DayPilotScheduler1.ClientState["filter"];
            DayPilotScheduler1.DataSource = getData(DayPilotScheduler1.StartDate, DayPilotScheduler1.EndDate, filter);
            DayPilotScheduler1.DataBind();
        }

        protected void DayPilotScheduler1_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
        {
            #region Simulation of database update

            DataRow dr = table.Rows.Find(e.Value);
            if (dr != null)
            {
                dr["start"] = e.NewStart;
                dr["end"] = e.NewEnd;
                dr["column"] = e.NewResource;
                table.AcceptChanges();
            }
            else // moved from outside
            {
                dr = table.NewRow();
                dr["start"] = e.NewStart;
                dr["end"] = e.NewEnd;
                dr["id"] = e.Value;
                dr["name"] = e.Text;
                dr["column"] = e.NewResource;

                table.Rows.Add(dr);
                table.AcceptChanges();
            }

            #endregion

            setDataSourceAndBind();

            DayPilotScheduler1.UpdateWithMessage("Event moved");
        }
        protected void DayPilotScheduler1_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
        {
            #region Simulation of database update

            DataRow dr = table.Rows.Find(e.Value);
            if (dr != null)
            {
                dr["start"] = e.NewStart;
                dr["end"] = e.NewEnd;
                table.AcceptChanges();
            }

            #endregion

            setDataSourceAndBind();
            DayPilotScheduler1.Update();
        }
        protected void DayPilotScheduler1_TimeRangeSelected(object sender, DayPilot.Web.Ui.Events.TimeRangeSelectedEventArgs e)
        {
            #region Simulation of database update

            DataRow dr = table.NewRow();
            dr["start"] = e.Start;
            dr["end"] = e.End;
            dr["id"] = Guid.NewGuid().ToString();
            dr["name"] = "New event";
            dr["column"] = e.Resource;

            table.Rows.Add(dr);
            table.AcceptChanges();
            #endregion

            setDataSourceAndBind();
            DayPilotScheduler1.UpdateWithMessage("New event created.");
        }
        protected void DayPilotScheduler1_EventEdit(object sender, DayPilot.Web.Ui.Events.EventEditEventArgs e)
        {
            #region Simulation of database update

            DataRow dr = table.Rows.Find(e.Value);
            if (dr != null)
            {
                dr["name"] = e.NewText;
                table.AcceptChanges();
            }

            #endregion

            setDataSourceAndBind();
            DayPilotScheduler1.Update();
        }

        protected void DayPilotScheduler1_BeforeEventRender(object sender, DayPilot.Web.Ui.Events.BeforeEventRenderEventArgs e)
        {
            if (e.Value == "11")
            {
                e.ContextMenuClientName = "cmSpecial";
                e.EventMoveEnabled = false;
                e.EventResizeEnabled = false;
                e.EventClickEnabled = false;
                e.DurationBarColor = "red";
            }
            else if (e.Value == "13")
            {
                e.DurationBarImageUrl = "../Media/linked/tentative5x8.gif";
            }
            e.BackgroundImage = "../Media/linked/gradient_dps.jpg";
            e.BackgroundRepeat = "repeat-x";

            e.ContextMenuClientName = "cmSpecial";
            e.InnerHTML = String.Format("<b>{0}</b><br/>Additional information", e.InnerHTML);

        }

        protected void DayPilotScheduler1_EventMenuClick(object sender, DayPilot.Web.Ui.Events.EventMenuClickEventArgs e)
        {
            switch (e.Command)
            {
                case "Delete":
                    #region Simulation of database update
                    DataRow dr = table.Rows.Find(e.Value);

                    if (dr != null)
                    {
                        table.Rows.Remove(dr);
                        table.AcceptChanges();
                    }
                    #endregion
                    break;
            }

            setDataSourceAndBind();
            DayPilotScheduler1.Update();
        }

        protected void DayPilotScheduler1_BeforeResHeaderRender(object sender, DayPilot.Web.Ui.Events.BeforeHeaderRenderEventArgs e)
        {
            if (e.IsCorner)
            {
                if (DayPilotScheduler1.IsExport)
                {
                    e.InnerHTML = DayPilotScheduler1.StartDate.Year.ToString();
                }
                else
                {
                    e.InnerHTML = String.Format("<div style='padding:5px; font-weight: bold; font-size:22px; text-align:center'>{0}</div>", DayPilotScheduler1.StartDate.Year);
                }
            }
        }

        protected void DayPilotBubble1_RenderContent(object sender, RenderEventArgs e)
        {
            if (e is RenderResourceBubbleEventArgs)
            {
                RenderResourceBubbleEventArgs re = e as RenderResourceBubbleEventArgs;
                e.InnerHTML = "<b>Resource header details</b><br />Value: " + re.ResourceId;
            }
            else if (e is RenderCellBubbleEventArgs)
            {
                RenderCellBubbleEventArgs re = e as RenderCellBubbleEventArgs;
                e.InnerHTML = "<b>Cell details</b><br />Resource:" + re.ResourceId + "<br />From:" + re.Start + "<br />To: " + re.End;
            }
        }

        protected void DayPilotScheduler1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "next":
                    DayPilotScheduler1.StartDate = DayPilotScheduler1.StartDate.AddYears(1);
                    DayPilotScheduler1.Days = Year.Days(DayPilotScheduler1.StartDate.Year);
                    DayPilotScheduler1.ScrollY = 20;
                    break;
                case "previous":
                    DayPilotScheduler1.StartDate = DayPilotScheduler1.StartDate.AddYears(-1);
                    DayPilotScheduler1.Days = Year.Days(DayPilotScheduler1.StartDate.Year);
                    break;
                case "this":
                    DayPilotScheduler1.StartDate = new DateTime(DateTime.Today.Year, 1, 1);
                    DayPilotScheduler1.Days = Year.Days(DayPilotScheduler1.StartDate.Year);
                    break;
                case "refresh":
                case "filter":
                    // refresh is always done, see setDataSourceAndBind()
                    break;
                default:
                    throw new Exception("Unknown command.");

            }

            setDataSourceAndBind();
            DayPilotScheduler1.Update();
        }

        protected void DayPilotScheduler1_EventClick(object sender, DayPilot.Web.Ui.Events.EventClickEventArgs e)
        {
            setDataSourceAndBind();
            DayPilotScheduler1.UpdateWithMessage(String.Format("Event {0} clicked.", e.Value));
            //throw new Exception("ScrollX: " + DayPilotScheduler1.ScrollX);
        }

        protected void DayPilotScheduler1_TimeRangeMenuClick(object sender, DayPilot.Web.Ui.Events.TimeRangeMenuClickEventArgs e)
        {
            if (e.Command == "Insert")
            {
                #region Simulation of database update

                DataRow dr = table.NewRow();
                dr["start"] = e.Start;
                dr["end"] = e.End;
                dr["id"] = Guid.NewGuid().ToString();
                dr["name"] = "New event";
                dr["column"] = e.ResourceId;

                table.Rows.Add(dr);
                table.AcceptChanges();
                #endregion

                setDataSourceAndBind();
                DayPilotScheduler1.Update();
            }
        }


        /// <summary>
        /// Make sure a copy of the data is in the Session so users can try changes on their own copy.
        /// </summary>
        private void initData()
        {
            if (Session["Scheduler"] == null)
            {
                Session["Scheduler"] = DataGenerator.GetData();
            }
            table = (DataTable)Session["Scheduler"];
        }

        /// <summary>
        /// This method should normally load the data from the database.
        /// We will load our copy from a Session, just simulating a database.
        /// </summary>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <param name="filter"></param>
        /// <returns></returns>
        private DataTable getData(DateTime start, DateTime end, string filter)
        {
            String select;
            if (String.IsNullOrEmpty(filter))
            {
                select = String.Format("NOT (([end] <= '{0:s}') OR ([start] >= '{1:s}'))", start, end);
            }
            else
            {
                select = String.Format("NOT (([end] <= '{0:s}') OR ([start] >= '{1:s}')) and [name] like '%{2}%'", start, end, filter);
            }
            //throw new Exception(select);

            DataRow[] rows = table.Select(select);
            DataTable filtered = table.Clone();
            foreach (DataRow r in rows)
            {
                filtered.ImportRow(r);
            }
            return filtered;
        }

        protected void DayPilotScheduler1_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.BeforeCellRenderEventArgs e)
        {
        }

        protected void DayPilotScheduler1_Refresh(object sender, DayPilot.Web.Ui.Events.RefreshEventArgs e)
        {
            DayPilotScheduler1.StartDate = e.StartDate;
            setDataSourceAndBind();
            DayPilotScheduler1.Update(CallBackUpdateType.Full);
        }

        protected void DayPilotBubble1_RenderEventBubble(object sender, RenderEventBubbleEventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("<b>{0}</b><br />", e.Text);
            sb.AppendFormat("Start: {0}<br />", e.Start);
            sb.AppendFormat("End: {0}<br />", e.End);
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b>Double-click the event to enter inline edit mode.</b>");

            e.InnerHTML = sb.ToString();

        }
        protected void DayPilotScheduler1_ResourceHeaderMenuClick(object sender, DayPilot.Web.Ui.Events.Scheduler.ResourceHeaderMenuClickEventArgs e)
        {
            switch (e.Command)
            {
                case "Insert":
                    e.Resource.Children.Add("Testing Child", Guid.NewGuid().ToString());
                    e.Resource.Expanded = true;
                    break;
                case "DeleteChildren":
                    e.Resource.Children.Clear();
                    break;
                case "Delete":
                    DayPilotScheduler1.Resources.RemoveFromTree(e.Resource);
                    break;
            }
            setDataSourceAndBind();
            DayPilotScheduler1.Update();
        }
        protected void DayPilotScheduler1_ResourceHeaderClick(object sender, DayPilot.Web.Ui.Events.Scheduler.ResourceHeaderClickEventArgs e)
        {
            DayPilotScheduler1.Resources.RemoveFromTree(e.Resource);
            setDataSourceAndBind();
            DayPilotScheduler1.Update();
        }
        protected void DayPilotScheduler1_BeforeTimeHeaderRender(object sender, DayPilot.Web.Ui.Events.BeforeTimeHeaderRenderEventArgs e)
        {
        }


    }



}