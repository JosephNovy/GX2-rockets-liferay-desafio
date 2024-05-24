<#assign hasCategories = false />
<#if entries?has_content>
	<@clay.row>
		<#list entries as entry>
			<#assign categories = entry.getCategories() />
			<#if categories?has_content>
				<#assign hasCategories = true />

				<div class="ml-4 w-75">
					<div class="results-header py-2 px-2">
						<h3>
							Procure novos blogs por categoria
						</h3>
					</div>

					<@displayCategories categories=categories />
				</div>
			</#if>
		</#list>
		<#if !hasCategories>
			${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}

			<div class="alert alert-info w-100">
				<@liferay_ui.message key="there-are-no-categories" />
			</div>
		</#if>
	</@clay.row>
</#if>
<#macro displayCategories
	categories
>
	<#if categories?has_content>
		<div class="blog-categories d-flex flex-md-column">
			<#list categories as category>
				<div class="category-item py-1 px-2 m-0">
					<#assign categoryURL = renderResponse.createRenderURL() />

					${categoryURL.setParameter("resetCur", "true")}
					${categoryURL.setParameter("categoryId", category.getCategoryId()?string)}

					<a class="category-link" href="http://localhost:8080/blog/-/categories/${category.getCategoryId()?string}">${category.getName()}</a>
					<#if serviceLocator??>
						<#assign
							assetCategoryService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryService")
							childCategories = assetCategoryService.getChildCategories(category.getCategoryId())
						/>
						<@displayCategories categories=childCategories />
					</#if>
				</div>
			</#list>
		</div>
	</#if>
</#macro>