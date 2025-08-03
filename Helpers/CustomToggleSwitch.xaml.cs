using System.Windows.Input;

namespace ESP32_pH.Helpers;

public partial class CustomToggleSwitch : ContentView
{
	public CustomToggleSwitch()
	{
		InitializeComponent();

        // Add tap gesture
        var tapGesture = new TapGestureRecognizer();
        tapGesture.Tapped += OnTapped;
        this.GestureRecognizers.Add(tapGesture);
    }
    // Bindable Properties
    public static readonly BindableProperty IsToggledProperty =
        BindableProperty.Create(nameof(IsToggled), typeof(bool), typeof(CustomToggleSwitch), false,
            propertyChanged: OnIsToggledChanged, defaultBindingMode: BindingMode.TwoWay);

    public static readonly BindableProperty OnColorProperty =
        BindableProperty.Create(nameof(OnColor), typeof(Color), typeof(CustomToggleSwitch), Color.FromArgb("#6366F1"));

    public static readonly BindableProperty OffColorProperty =
        BindableProperty.Create(nameof(OffColor), typeof(Color), typeof(CustomToggleSwitch), Color.FromArgb("#D1D5DB"));

    public static readonly BindableProperty ThumbColorProperty =
        BindableProperty.Create(nameof(ThumbColor), typeof(Color), typeof(CustomToggleSwitch), Colors.White);

    public static readonly BindableProperty CommandProperty =
        BindableProperty.Create(nameof(Command), typeof(ICommand), typeof(CustomToggleSwitch));

    public static readonly BindableProperty CommandParameterProperty =
        BindableProperty.Create(nameof(CommandParameter), typeof(object), typeof(CustomToggleSwitch));

    public static readonly BindableProperty HeightCustomProperty =
        BindableProperty.Create(nameof(HeightCustom), typeof(double), typeof(CustomToggleSwitch), 34.0);

    public static readonly BindableProperty WidthCustomProperty =
        BindableProperty.Create(nameof(WidthCustom), typeof(double), typeof(CustomToggleSwitch), 60.0);

    public static readonly BindableProperty ShowTextProperty =
        BindableProperty.Create(nameof(ShowText), typeof(bool), typeof(CustomToggleSwitch), true);

    public static readonly BindableProperty OnTextProperty =
        BindableProperty.Create(nameof(OnText), typeof(string), typeof(CustomToggleSwitch), "ON");

    public static readonly BindableProperty OffTextProperty =
        BindableProperty.Create(nameof(OffText), typeof(string), typeof(CustomToggleSwitch), "OFF");

    public static readonly BindableProperty TextColorProperty =
        BindableProperty.Create(nameof(TextColor), typeof(Color), typeof(CustomToggleSwitch), Colors.White);

    public static readonly BindableProperty FontSizeProperty =
        BindableProperty.Create(nameof(FontSize), typeof(double), typeof(CustomToggleSwitch), 10.0);

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

    //public CustomToggleSwitch()
    //{
    //    InitializeComponent();

    //}

    private void OnTapped(object sender, EventArgs e)
    {
        if (!IsEnabled) return;

        var newValue = !IsToggled;
        SetValue(IsToggledProperty, newValue);

        // Execute command
        if (Command?.CanExecute(CommandParameter ?? newValue) == true)
        {
            Command.Execute(CommandParameter ?? newValue);
        }

        // Fire event
        Toggled?.Invoke(this, new ToggledEventArgs(newValue));
    }

    private static void OnIsToggledChanged(BindableObject bindable, object oldValue, object newValue)
    {
        if (bindable is CustomToggleSwitch toggle)
        {
            toggle.UpdateVisualState();
        }
    }

    private async void UpdateVisualState()
    {
        // Update background color
        var background = this.FindByName<BoxView>("BackgroundBox");
        if (background != null)
        {
            background.BackgroundColor = IsToggled ? OnColor : OffColor;
        }

        // Update text visibility
        var onLabel = this.FindByName<Label>("OnLabel");
        var offLabel = this.FindByName<Label>("OffLabel");

        if (onLabel != null && offLabel != null)
        {
            onLabel.IsVisible = ShowText && IsToggled;
            offLabel.IsVisible = ShowText && !IsToggled;
        }

        // Animate thumb
        var thumb = this.FindByName<Frame>("ThumbFrame");
        if (thumb != null)
        {
            var thumbSize = HeightCustom - 8;
            var maxTranslation = WidthCustom - thumbSize - 8;
            var targetX = IsToggled ? maxTranslation : 4;

            await thumb.TranslateTo(targetX, 0, 200, Easing.CubicInOut);
        }
    }

    protected override void OnPropertyChanged(string propertyName = null)
    {
        base.OnPropertyChanged(propertyName);

        if (propertyName == nameof(IsEnabled))
        {
            Opacity = IsEnabled ? 1.0 : 0.5;
        }
    }
}

public class ToggledEventArgs : EventArgs
{
    public bool Value { get; }
    public ToggledEventArgs(bool value) => Value = value;
}