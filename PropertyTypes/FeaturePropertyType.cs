namespace DemoSite.PropertyTypes {
    using KalikoCMS.Attributes;
    using KalikoCMS.Core;
    using KalikoCMS.Serialization;

    [PropertyType("9033A828-B49A-4A19-9C20-0F9BEBBD3273", "Feature", "Feature", "~/PropertyTypes/FeaturePropertyEditor.ascx")]
    public class FeatureProperty : PropertyData {
        private int? _cachedHashCode;

        public FeatureProperty() { 
        }

        public FeatureProperty(string header, string description, string url) {
            Header = header;
            Description = description;
            Url = url;
        }

        public string Header { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }

        protected override string StringValue {
            get { return string.Format("{0}", Header); }
        }

        protected override PropertyData DeserializeFromJson(string data) {
            return JsonSerialization.DeserializeJson<FeatureProperty>(data);
        }
        
        public override int GetHashCode() {
            return (int)(_cachedHashCode ?? (_cachedHashCode = CalculateHashCode()));
        }

        private int CalculateHashCode() {
            int hash = JsonSerialization.GetNewHash();
            hash = JsonSerialization.CombineHashCode(hash, Header);
            hash = JsonSerialization.CombineHashCode(hash, Description);
            hash = JsonSerialization.CombineHashCode(hash, Url);

            return hash;
        }
    }
}