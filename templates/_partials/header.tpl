{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-container">
  {block name='header_banner'}
    <div class="userbasket backgroundImageLogo backgroundImageLogoHeight">
      <div class="uk-child-width-1-2" uk-grid>
        <div>
          {hook h='displayNav1'}
        </div>
        <div class="uk-text-right">
          {hook h='displayNav2'}
        </div>
      </div>
    </div>
  {/block}

  {block name='header_top'}

      <nav class="uk-navbar-container" uk-navbar>
        <div class="uk-navbar-left nav-overlay">
          <a class="uk-navbar-toggle" href="#sideBarMenu" uk-toggle uk-navbar-toggle-icon ></a>
          <ul class="uk-navbar-nav">
            <li><a href="{$urls.base_url}" uk-icon="icon: home"></a></li>
          </ul>
        </div>
        {hook h='displayTop'}
      </nav>

  {/block}
</div>