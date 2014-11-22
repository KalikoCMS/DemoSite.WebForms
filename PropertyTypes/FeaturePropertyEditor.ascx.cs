
namespace Kaliko.Web.CustomPropertyTypes {
    using DemoSite.PropertyTypes;
    using KalikoCMS.Core;
    using KalikoCMS.PropertyType;

    public partial class FeaturePropertyEditor : PropertyEditorBase {
        public override string PropertyLabel {
            set { LabelText.Text = value; }
        }

        public override bool Validate() {
            return true;
        }

        public override bool Validate(bool required) {
            return true;
        }

        public override PropertyData PropertyValue {
            get {
                var property = new FeatureProperty {
                    Header = HeaderField.Text, 
                    Description = DescriptionField.Text, 
                    Url = UrlField.Text
                };

                return property;
            }
            set {
                var property = (FeatureProperty)value;

                HeaderField.Text = property.Header;
                DescriptionField.Text = property.Description;
                UrlField.Text = property.Url;
            }
        }

        public override string Parameters {
            set { throw new System.NotImplementedException(); }
        }
    }
}