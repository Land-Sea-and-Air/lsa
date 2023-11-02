BaseTemplates = {}
function BaseTemplates.templates()
    return {
        [DefaultBaseTemplate.name] = DefaultBaseTemplate,
        [FarpBaseTemplate.name] = FarpBaseTemplate,
        [SamSiteBaseTemplate.name] = SamSiteBaseTemplate,
        [EwrsBaseTemplate.name] = EwrsBaseTemplate
    }
end