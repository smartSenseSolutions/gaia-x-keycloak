<#import "template.ftl" as layout>
<div class="webauthn-authenticate">
    <div class="layout-main__top">
        <h3>Failed to authenticate by the Security key.</h3>
        <img style="opacity:0;" src="${url.resourcesPath}/images/logo.png" alt="" />
    </div>

    <div class="layout-main__bottom">
        <div class="cards-container">
            <div class="card-layout">
                <div class="card-layout__header">
                    <h2>Authentication Failed</h2>
                </div> 
                       
                <@layout.registrationLayout displayMessage=true; section>
                    <#if section = "header">
                        ${kcSanitize(msg("webauthn-error-title"))?no_esc}
                    <#elseif section = "form">

                        <script type="text/javascript">
                            refreshPage = () => {
                                document.getElementById('isSetRetry').value = 'retry';
                                document.getElementById('executionValue').value = '${execution}';
                                document.getElementById('kc-error-credential-form').submit();
                            }
                        </script>

                        <form id="kc-error-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
                            method="post">
                            <input type="hidden" id="executionValue" name="authenticationExecution"/>
                            <input type="hidden" id="isSetRetry" name="isSetRetry"/>
                        </form>

                        <div id="kc-form-buttons">
                            <input tabindex="4" onclick="refreshPage()" type="button"
                                class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                name="try-again" id="kc-try-again" value='${kcSanitize(msg("doTryAgain"))?no_esc}'
                            />
                        </div>

                        <#if isAppInitiatedAction??>
                            <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-webauthn-settings-form" method="post">
                                <button type="submit"
                                        class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                        id="cancelWebAuthnAIA" name="cancel-aia" value="true">${msg("doCancel")}
                                </button>
                            </form>
                        </#if>

                    </#if>
                </@layout.registrationLayout>
            </div>
        </div>
    </div>
</div>