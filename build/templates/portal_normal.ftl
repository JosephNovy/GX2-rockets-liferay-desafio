<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merienda:wght@300..900&display=swap" rel="stylesheet">

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid position-relative" id="wrapper">
	<header id="banner" role="banner">
		<div id="heading" class="h-50 pt-5">
			<div aria-level="1" class="d-flex site-title" role="heading">
				
				<#if show_site_name>
					<span class="site-name d-flex justify-content-center align-items-center w-100" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
				<div class="position-relative">
					<div>
						<div class="mini-cart-fragment" style="--mini-cart-icon-color: var(--gray-600);">
							<@liferay_commerce_ui["mini-cart"]
							displayTotalItemsQuantity=true
							spritemap="${themeDisplay.getPathThemeImages()}/clay/icons.svg"
							toggleable=true
								/>
						</div>
					</div>
						<div class="autofit-col mr-6 user-icon-acess mr-xxl-2">
							<@liferay.user_personal_bar />
						</div>
				</div>
			</div>
		</div>

		

		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
	</header>

	<section id="content">
		<h2 class="hide-accessible sr-only" role="heading" aria-level="1">${htmlUtil.escape(the_title)}</h2>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language_format
				arguments='<a href="http://www.liferay.com" rel="external">Liferay</a>'
				key="powered-by-x"
			/>
		</p>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />
</body>

</html>

