<#import "template.ftl" as layout>
<link href="${url.resourcesPath}/styles/styles.css" rel="stylesheet"/>

<div class="info-file">
    <div class="layout-main__top">
        <h3>Let’s get you started <br />
        on your Gaia-X experience! </h3>
        <img src="${url.resourcesPath}/images/logo.png" alt="" />
    </div>
   
   <div class="layout-main__bottom">
        <div class="steper-container">
            <ul>   
                <li>
                    <img src="${url.resourcesPath}/images/stick-fill.png" alt="" />
                </li>

                <li>
                    <#if actionUri?has_content>
                        <img src="${url.resourcesPath}/images/stick.png" alt="" />
                    <#elseif (client.baseUrl)?has_content>
                        <img src="${url.resourcesPath}/images/stick-fill.png" alt="" />
                    </#if>
                </li>

                <li>
                    <#if actionUri?has_content>
                        <img src="${url.resourcesPath}/images/stick.png" alt="" />
                    <#elseif (client.baseUrl)?has_content>
                        <img src="${url.resourcesPath}/images/stick-fill.png" alt="" />
                    </#if>
                </li>
            </ul>
        </div>

        <div class="cards-container">
            <#if actionUri?has_content>
                <div class="card-layout">
                    <@layout.registrationLayout displayMessage=false; section>
                        <#if section = "header">
                            <#if messageHeader??>
                            ${messageHeader}
                            <#else>
                            ${message.summary}
                            </#if>
                        <#elseif section = "form">
                        <div id="kc-info-message info-section">
                            <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
                            <#if skipLink??>
                            <#else>
                                <#if pageRedirectUri?has_content>
                                    <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                                <#elseif actionUri?has_content>
                                <p class="proceed-link"><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
                                <#elseif (client.baseUrl)?has_content>
                                    <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                                </#if>
                            </#if>
                        </div>
                        </#if>
                    </@layout.registrationLayout>
                </div>

                <div class="card-layout lock-screen">
                    <img src="${url.resourcesPath}/images/lock.png" alt="" />
                    <p>Unlock <br/> by completing the steps</p>
                </div>

                <div class="card-layout lock-screen">
                    <img src="${url.resourcesPath}/images/lock.png" alt="" />
                    <p>Unlock <br/> by completing the steps</p>
                </div>

            <#elseif (client.baseUrl)?has_content>
                <div class="card-layout">
                    <h1>Webauthn Register Passwordless</h1>
                    <p>Please start the webauthn registeration process by clicking on the Proceed button </p>
                    <div class="proceed-link">
                        <span>Completed</span>
                    </div>
                </div>

                <div class="card-layout">
                    <h1>Security key registration</h1>
                    <p>Sign out from other devices</p>
                    <div class="proceed-link">
                        <span>Completed</span>
                    </div>
                </div>

                <div class="card-layout">
                    <h1>Congratulations</h1>
                    <p>Your account has been created successfully. You are now a member of GaiaX Lorem ipsum</p>
                    <div class="proceed-link">
                        <a href="${client.baseUrl}">${kcSanitize(msg("signIn"))?no_esc}</a>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div>