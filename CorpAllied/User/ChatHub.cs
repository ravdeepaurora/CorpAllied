using System;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace CorpAllied.User
{
    public class ChatHub : Hub
    {
        public void Send(string name, string message)
        {
            // Call the broadcastMessage method to update clients.
            Console.Write(Clients.ToString());
            Clients.All.broadcastMessage(name, message);
        }
    }
}
