# DocuSeal CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/docuseal"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy DocuSeal server with CI/CD on Elestio

<img src="docuseal.jpg" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open DocuSeal ADMIN UI here:

    URL: https://[CI_CD_DOMAIN]
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# SMTP

To configure the SMTP server, click on settings on the top right of the screen, then, click on Email on the left tab.

you can configure the SMTP server with the following credentials:

    Host: 172.17.0.1
    Port: 25
    Username: <space>
    Password: <space>
    Send from Email: [DOMAIN]@vm.elestio.app
