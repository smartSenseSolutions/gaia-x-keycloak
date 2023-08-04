<#import "template.ftl" as layout>
<div class="info-file">
    <div class="layout-main__top">
        <h3>Webauthn Register Passwordless</h3>
        <img src="${url.resourcesPath}/images/logo.png" alt="" />
    </div>
   
   <div class="layout-main__bottom">
        <div class="steper-container">
            <ul>   
                <li>
                    <img src="${url.resourcesPath}/images/stick-fill.png" alt="" />
                </li>

                <li>
                    <img src="${url.resourcesPath}/images/stick.png" alt="" />
                </li>

                <li>
                    <img src="${url.resourcesPath}/images/stick.png" alt="" />
                </li>
            </ul>
        </div>

        <div class="cards-container">
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
        </div>
    </div>
</div>