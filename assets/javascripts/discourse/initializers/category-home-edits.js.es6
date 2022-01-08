import { setDefaultHomepage } from "discourse/lib/utilities";
import { ajax } from "discourse/lib/ajax";
import DiscourseURL from "discourse/lib/url";
import { withPluginApi } from "discourse/lib/plugin-api";
import { computed } from "@ember/object";
import getURL from "discourse-common/lib/get-url";

export default {
  name: "category-home-edits",
  initialize(container) {
    const siteSettings = container.lookup("site-settings:main");
    if (siteSettings.discourse_category_home_enabled) {
      ajax("/categoryhome/home_category", {
        type: "GET",
      })
        .then(function (result) {
          if (Number.isInteger(result)) {
            let url = `/c/${result}`;
            setDefaultHomepage(url);
            DiscourseURL.routeTo(url);
          }
        })
        .catch(function (err) {
          console.log({ err });
        })
        .finally(function () {
          // placeholder
        });

      withPluginApi("0.8.32", (api) => {
        api.modifyClass("component:category-drop", {
          allCategoriesUrl: computed(
            "parentCategoryUrl",
            "selectKit.options.subCategory",
            function () {
              return getURL(
                this.selectKit.options.subCategory
                  ? `${this.parentCategoryUrl}/all` || "/"
                  : "/latest"
              );
            }
          ),
        });
      });
    }
  },
};
