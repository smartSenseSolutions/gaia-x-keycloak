<#import "template.ftl" as layout>
<div class="webauthn-authenticate">
    <div class="layout-main__top">
        <h3>Cookies need to enabled in your browser.</h3>
        <img src="${url.resourcesPath}/images/logo.png" alt="" />
    </div>

    <div class="layout-main__bottom">
        <div class="cards-container">
            <div class="card-layout">
                <div class="card-layout__header">
                    <h2>Cookie not found.</h2>
                </div>

                <@layout.registrationLayout displayMessage=false; section>
                    <#if section = "header">
                        ${kcSanitize(msg("errorTitle"))?no_esc}
                    <#elseif section = "form">
                        <div id="kc-error-message">
                            <p class="instruction">${kcSanitize(message.summary)?no_esc}</p>
                            <#if skipLink??>
                            <#else>
                                <#if client?? && client.baseUrl?has_content>
                                    <div id="kc-form-buttons">
                                        <a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                                    </div>
                                </#if>
                            </#if>
                        </div>
                    </#if>
                </@layout.registrationLayout>
            </div>
        </div>
    </div>
</div>