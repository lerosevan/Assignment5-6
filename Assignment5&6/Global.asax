<%@ Application Language="C#" %>
<script runat="server">
    // Event handler for application start
    void Application_Start(object sender, EventArgs e)
    {
        // Store the application start time in the application state
        Application["AppStartTime"] = DateTime.Now;
    }

    // Event handler for application errors
    void Application_Error(object sender, EventArgs e)
    {
        // Get the last error that occurred on the server
        Exception ex = Server.GetLastError();
        // Log the error details to a file
        System.IO.File.AppendAllText(Server.MapPath("~/AppErrorLog.txt"), ex.ToString());
    }
</script>

