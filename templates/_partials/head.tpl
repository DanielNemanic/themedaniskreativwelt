{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
{/block}

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
  {block name='head_hreflang'}
      {foreach from=$urls.alternative_langs item=pageUrl key=code}
            <link rel="alternate" href="{$urls.base_url}" hreflang="{$code}">
      {/foreach}
  {/block}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
{/block}

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$shop.favicon}?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$shop.favicon}?{$shop.favicon_update_time}">

  <link rel="apple-touch-icon" sizes="57x57" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192"  href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/favicon-16x16.png">
  <link rel="manifest" href="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/manifest.json">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="{$urls.base_url}themes/themedaniskreativwelt/assets/images/logo2021/favicon/ms-icon-144x144.png">
  <meta name="theme-color" content="#ffffff">
{/block}

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}{/block}
