{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<!doctype html>
<html lang="{$language.iso_code}">
<head>
    {block name='head'}
        {include file='_partials/head.tpl'}
    {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">
{block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
{/block}

{block name='additional_meta_information'}{/block}

{block name='product_activation'}
    {include file='catalog/_partials/product-activation.tpl'}
{/block}

<header id="header">
    {block name='header'}
        {include file='_partials/header.tpl'}
    {/block}
</header>

<div class="uk-section uk-section-xsmall uk-padding-remove-top" >
    {hook h="displayWrapperTop"}
    <div class="uk-container uk-card uk-card-default" style="padding-bottom: 20px;">
        <div uk-grid>
            {block name="content_wrapper"}
                <div id="content-wrapper" class="uk-width-1-1">
                    {block name='notifications'}
                        {include file='_partials/notifications.tpl'}
                    {/block}

                    {hook h="displayContentWrapperTop"}
                    {block name="content"}
                        <p>Hello world! This is HTML5 Boilerplate.</p>
                    {/block}
                    {hook h="displayContentWrapperBottom"}
                </div>
            {/block}
        </div>
        {hook h="displayWrapperBottom"}

        <div class="uk-margin-large-top uk-text-center">
            <a href="#" class="uk-icon-button" uk-totop uk-scroll uk-tooltip="{l s='Back to top' d='Shop.Theme.Actions'}"></a>
        </div>
    </div>
</div>

{block name='page_footer_container'}
    <footer id="footer">
        {block name="footer"}
            {include file="_partials/footer.tpl"}
        {/block}
    </footer>
{/block}

{block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
{/block}

{block name='hook_before_body_closing_tag'}
    {hook h='displayBeforeBodyClosingTag'}
{/block}

<div id="modalLoading" class="uk-flex-top" uk-modal>
    <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
        <p class='uk-text-center'><span uk-spinner="ratio: 3"></span></p>
    </div>
</div>
</body>

</html>
