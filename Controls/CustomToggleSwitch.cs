using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ESP32pH.Controls
{
    public class CustomToggleSwitch : ContentView
    {
        // Bindable Properties
        public static readonly BindableProperty IsToggledProperty =
            BindableProperty.Create(nameof(IsToggled), typeof(bool), typeof(CustomToggleSwitch), false,
                propertyChanged: OnIsToggledChanged, defaultBindingMode: BindingMode.TwoWay);

        public static readonly BindableProperty OnColorProperty =
            BindableProperty.Create(nameof(OnColor), typeof(Color), typeof(CustomToggleSwitch), Color.FromArgb("#6366F1"),
                propertyChanged: OnColorPropertyChanged);

        public static readonly BindableProperty OffColorProperty =
            BindableProperty.Create(nameof(OffColor), typeof(Color), typeof(CustomToggleSwitch), Color.FromArgb("#D1D5DB"),
                propertyChanged: OnColorPropertyChanged);

        public static readonly BindableProperty ThumbColorProperty =
            BindableProperty.Create(nameof(ThumbColor), typeof(Color), typeof(CustomToggleSwitch), Colors.White,
                propertyChanged: OnColorPropertyChanged);

        public static readonly BindableProperty CommandProperty =
            BindableProperty.Create(nameof(Command), typeof(ICommand), typeof(CustomToggleSwitch));

        public static readonly BindableProperty CommandParameterProperty =
            BindableProperty.Create(nameof(CommandParameter), typeof(object), typeof(CustomToggleSwitch));

        public static readonly BindableProperty HeightCustomProperty =
            BindableProperty.Create(nameof(HeightCustom), typeof(double), typeof(CustomToggleSwitch), 34.0,
                propertyChanged: OnSizePropertyChanged);

        public static readonly BindableProperty WidthCustomProperty =
            BindableProperty.Create(nameof(WidthCustom), typeof(double), typeof(CustomToggleSwitch), 60.0,
                propertyChanged: OnSizePropertyChanged);

        public static readonly BindableProperty ShowTextProperty =
            BindableProperty.Create(nameof(ShowText), typeof(bool), typeof(CustomToggleSwitch), true,
                propertyChanged: OnShowTextChanged);

        public static readonly BindableProperty OnTextProperty =
            BindableProperty.Create(nameof(OnText), typeof(string), typeof(CustomToggleSwitch), "ON",
                propertyChanged: OnTextPropertyChanged);

        public static readonly BindableProperty OffTextProperty =
            BindableProperty.Create(nameof(OffText), typeof(string), typeof(CustomToggleSwitch), "OFF",
                propertyChanged: OnTextPropertyChanged);

        public static readonly BindableProperty TextColorProperty =
            BindableProperty.Create(nameof(TextColor), typeof(Color), typeof(CustomToggleSwitch), Colors.White,
                propertyChanged: OnTextPropertyChanged);

        public static readonly BindableProperty FontSizeProperty =
            BindableProperty.Create(nameof(FontSize), typeof(double), typeof(CustomToggleSwitch), 10.0,
                propertyChanged: OnTextPropertyChanged);

        // Properties
        public bool IsToggled
        {
            get => (bool)GetValue(IsToggledProperty);
            set => SetValue(IsToggledProperty, value);
        }

        public Color OnColor
        {
            get => (Color)GetValue(OnColorProperty);
            set => SetValue(OnColorProperty, value);
        }

        public Color OffColor
        {
            get => (Color)GetValue(OffColorProperty);
            set => SetValue(OffColorProperty, value);
        }

        public Color ThumbColor
        {
            get => (Color)GetValue(ThumbColorProperty);
            set => SetValue(ThumbColorProperty, value);
        }

        public ICommand Command
        {
            get => (ICommand)GetValue(CommandProperty);
            set => SetValue(CommandProperty, value);
        }

        public object CommandParameter
        {
            get => GetValue(CommandParameterProperty);
            set => SetValue(CommandParameterProperty, value);
        }

        public double HeightCustom
        {
            get => (double)GetValue(HeightCustomProperty);
            set => SetValue(HeightCustomProperty, value);
        }

        public double WidthCustom
        {
            get => (double)GetValue(WidthCustomProperty);
            set => SetValue(WidthCustomProperty, value);
        }

        public bool ShowText
        {
            get => (bool)GetValue(ShowTextProperty);
            set => SetValue(ShowTextProperty, value);
        }

        public string OnText
        {
            get => (string)GetValue(OnTextProperty);
            set => SetValue(OnTextProperty, value);
        }

        public string OffText
        {
            get => (string)GetValue(OffTextProperty);
            set => SetValue(OffTextProperty, value);
        }

        public Color TextColor
        {
            get => (Color)GetValue(TextColorProperty);
            set => SetValue(TextColorProperty, value);
        }

        public double FontSize
        {
            get => (double)GetValue(FontSizeProperty);
            set => SetValue(FontSizeProperty, value);
        }

        // Events
        public event EventHandler<ToggledEventArgs> Toggled;

        // Private fields
        private Grid _container;
        private BoxView _background;
        private Frame _thumb;
        private Label _onLabel;
        private Label _offLabel;
        private bool _isInitialized = false;

        public CustomToggleSwitch()
        {
            InitializeControl();
        }

        private void InitializeControl()
        {
            // Set default dimensions
            UpdateDimensions();

            // Create container
            _container = new Grid
            {
                BackgroundColor = Colors.Transparent,
                HorizontalOptions = LayoutOptions.Fill,
                VerticalOptions = LayoutOptions.Fill
            };

            // Create background
            _background = new BoxView
            {
                BackgroundColor = OffColor,
                CornerRadius = (float)(HeightCustom / 2),
                HorizontalOptions = LayoutOptions.Fill,
                VerticalOptions = LayoutOptions.Fill
            };

            // Create thumb
            var thumbSize = HeightCustom - 8; // 4px padding on each side
            _thumb = new Frame
            {
                BackgroundColor = ThumbColor,
                CornerRadius = (float)(thumbSize / 2),
                Padding = 0,
                HasShadow = true,
                BorderColor = Colors.Transparent,
                HeightRequest = thumbSize,
                WidthRequest = thumbSize,
                HorizontalOptions = LayoutOptions.Start,
                VerticalOptions = LayoutOptions.Center,
                TranslationX = 4
            };

            // Add shadow effect
            _thumb.Shadow = new Shadow
            {
                Brush = Brush.Black,
                Offset = new Point(0, 2),
                Radius = 4,
                Opacity = 0.3f
            };

            // Create ON label
            _onLabel = new Label
            {
                Text = OnText,
                TextColor = TextColor,
                FontSize = FontSize,
                FontAttributes = FontAttributes.Bold,
                HorizontalOptions = LayoutOptions.Start,
                VerticalOptions = LayoutOptions.Center,
                HorizontalTextAlignment = TextAlignment.Center,
                VerticalTextAlignment = TextAlignment.Center,
                Margin = new Thickness(8, 0, 0, 0),
                IsVisible = ShowText && IsToggled
            };

            // Create OFF label
            _offLabel = new Label
            {
                Text = OffText,
                TextColor = TextColor,
                FontSize = FontSize,
                FontAttributes = FontAttributes.Bold,
                HorizontalOptions = LayoutOptions.End,
                VerticalOptions = LayoutOptions.Center,
                HorizontalTextAlignment = TextAlignment.Center,
                VerticalTextAlignment = TextAlignment.Center,
                Margin = new Thickness(0, 0, 8, 0),
                IsVisible = ShowText && !IsToggled
            };

            // Add controls to container (order matters for layering)
            _container.Children.Add(_background);
            _container.Children.Add(_onLabel);
            _container.Children.Add(_offLabel);
            _container.Children.Add(_thumb);

            // Add gesture recognizers
            var tapGesture = new TapGestureRecognizer();
            tapGesture.Tapped += OnContainerTapped;
            _container.GestureRecognizers.Add(tapGesture);

            var mainTapGesture = new TapGestureRecognizer();
            mainTapGesture.Tapped += OnMainViewTapped;
            this.GestureRecognizers.Add(mainTapGesture);

            Content = _container;
            _isInitialized = true;

            // Initial visual update
            UpdateVisualState(false);
        }

        private void UpdateDimensions()
        {
            // Ensure minimum dimensions
            var height = HeightCustom > 0 ? HeightCustom : 34;
            var width = WidthCustom > 0 ? WidthCustom : 60;

            HeightRequest = height;
            WidthRequest = width;

            // Update background corner radius if initialized
            if (_background != null)
            {
                _background.CornerRadius = (float)(height / 2);
            }

            // Update thumb size and corner radius if initialized
            if (_thumb != null)
            {
                var thumbSize = height - 8;
                _thumb.HeightRequest = thumbSize;
                _thumb.WidthRequest = thumbSize;
                _thumb.CornerRadius = (float)(thumbSize / 2);
            }
        }

        private void OnContainerTapped(object sender, EventArgs e)
        {
            HandleTap();
        }

        private void OnMainViewTapped(object sender, EventArgs e)
        {
            HandleTap();
        }

        private void HandleTap()
        {
            if (!IsEnabled) return;

            var newValue = !IsToggled;

            // Update the property
            SetValue(IsToggledProperty, newValue);

            // Execute command if available
            if (Command?.CanExecute(CommandParameter ?? newValue) == true)
            {
                Command.Execute(CommandParameter ?? newValue);
            }

            // Fire event
            Toggled?.Invoke(this, new ToggledEventArgs(newValue));
        }

        private static void OnIsToggledChanged(BindableObject bindable, object oldValue, object newValue)
        {
            if (bindable is CustomToggleSwitch toggle && toggle._isInitialized)
            {
                toggle.UpdateVisualState(true);
            }
        }

        private static void OnColorPropertyChanged(BindableObject bindable, object oldValue, object newValue)
        {
            if (bindable is CustomToggleSwitch toggle && toggle._isInitialized)
            {
                toggle.UpdateColors();
            }
        }

        private static void OnSizePropertyChanged(BindableObject bindable, object oldValue, object newValue)
        {
            if (bindable is CustomToggleSwitch toggle && toggle._isInitialized)
            {
                toggle.UpdateDimensions();
            }
        }

        private static void OnShowTextChanged(BindableObject bindable, object oldValue, object newValue)
        {
            if (bindable is CustomToggleSwitch toggle && toggle._isInitialized)
            {
                toggle.UpdateTextVisibility();
            }
        }

        private static void OnTextPropertyChanged(BindableObject bindable, object oldValue, object newValue)
        {
            if (bindable is CustomToggleSwitch toggle && toggle._isInitialized)
            {
                toggle.UpdateTextProperties();
            }
        }

        private void UpdateColors()
        {
            if (_background != null)
            {
                _background.BackgroundColor = IsToggled ? OnColor : OffColor;
            }

            if (_thumb != null)
            {
                _thumb.BackgroundColor = ThumbColor;
            }
        }

        private void UpdateTextVisibility()
        {
            if (_onLabel != null && _offLabel != null)
            {
                _onLabel.IsVisible = ShowText && IsToggled;
                _offLabel.IsVisible = ShowText && !IsToggled;
            }
        }

        private void UpdateTextProperties()
        {
            if (_onLabel != null)
            {
                _onLabel.Text = OnText;
                _onLabel.TextColor = TextColor;
                _onLabel.FontSize = FontSize;
            }

            if (_offLabel != null)
            {
                _offLabel.Text = OffText;
                _offLabel.TextColor = TextColor;
                _offLabel.FontSize = FontSize;
            }
        }

        private async void UpdateVisualState(bool animate = true)
        {
            if (!_isInitialized || _background == null || _thumb == null) return;

            // Update colors
            UpdateColors();

            // Update text visibility
            UpdateTextVisibility();

            // Calculate thumb position
            var thumbSize = HeightCustom - 8;
            var maxTranslation = WidthCustom - thumbSize - 8; // 4px padding on each side
            var targetX = IsToggled ? maxTranslation : 4;

            if (animate)
            {
                // Animate thumb movement
                await _thumb.TranslateTo(targetX, 0, 200, Easing.CubicInOut);
            }
            else
            {
                // Set position immediately
                _thumb.TranslationX = targetX;
            }
        }

        protected override void OnPropertyChanged(string propertyName = null)
        {
            base.OnPropertyChanged(propertyName);

            if (propertyName == nameof(IsEnabled) && _container != null)
            {
                _container.Opacity = IsEnabled ? 1.0 : 0.5;
            }
        }
    }

    public class ToggledEventArgs : EventArgs
    {
        public bool Value { get; }

        public ToggledEventArgs(bool value)
        {
            Value = value;
        }
    }
}
