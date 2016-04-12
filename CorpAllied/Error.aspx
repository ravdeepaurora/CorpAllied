<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="CorpAllied.Error" %>

<!DOCTYPE html>
<html>
<head>
    <title>Oops! Error Occured</title>
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <script src="js/jquery.js"> </script>
    <!--<script src="lib/zepto/zepto.min.js"> </script>-->
    <script src="js/parsley/parsley.js"> </script>
    <script src="js/backbone/underscore-min.js"></script>
    <script src="js/settings.js"> </script>
</head>
<body>
<div class="single-widget-container error-page">
    <section class="widget transparent widget-404">
        <div class="body">
            <div class="row">
                <div class="col-md-5">
                    <h1 class="text-align-center">404</h1>
                </div>
                <div class="col-md-7">
                    <div class="description">
                        <h3>Oops, it seems that this page does not exist here or you need to Login to access this page.</h3>
                        <p>If you are sure it should, search for it or try again after sometime.</p>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="widget widget-404-search">
        <div class="body no-margin">
            <form class="form-inline form-search no-margin text-align-center" method="get" action="special_search.html"
                  role="form">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                    <input type="search" class="form-control"
                           placeholder="Pages: Posts, Tags">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">
                            &nbsp; Search &nbsp;
                        </button>
                    </span>
                </div>
            </form>
        </div>
    </section>
</div>
</body>
</html>