#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct main0_out
{
    float4 m_20 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float2 gl_PointCoord [[point_coord]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_PointCoord.y;
    float _36 = gl_PointCoord.x;
    float _38 = fma(_34, 2.0, -1.0);
    float _40 = fma(_36, 2.0, -1.0);
    float _42 = _38 * _38;
    float _44 = fma(_40, _40, _42);
    bool _48 = _44 > 1.0;
    int _51 = as_type<int>(_36);
    int _53 = as_type<int>(_42);
    if (_48)
    {
        _51 = 0;
        _53 = 0;
    }
    int _55 = _51;
    int _57 = _53;
    int _59 = 0;
    int _61 = 0;
    if (_48)
    {
        _59 = 0;
        _61 = 0;
    }
    int _63 = _59;
    int _65 = _61;
    if (_48)
    {
        out.m_20.x = as_type<float>(_55);
        out.m_20.y = as_type<float>(_57);
        out.m_20.z = as_type<float>(_63);
        out.m_20.w = as_type<float>(_65);
        return out;
    }
    float _67 = gl_FragCoord.w;
    float _69 = in.m_25.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_25.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = sqrt(_44);
    float _83 = in.m_27.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _67;
    float _91 = _89 * _73;
    float _93 = _89 * _79;
    float _95 = -_91;
    float _97 = fma(_81, _93, _95);
    float _99 = _97 * 0.834999978542327880859375;
    bool _101 = _97 > 0.0;
    float _103 = _99 * _99;
    float _105 = -_91;
    bool _107 = _97 < _105;
    bool _109 = _107 || _101;
    float _111 = _89 * _87;
    float _113 = _103 * _103;
    float _115 = fma(_103, _113, 1.0);
    float _117 = 1.0 / _115;
    float _119 = _99 * _117;
    float _121 = _111 * _119;
    float _123 = _119;
    if (!_109)
    {
        _123 = 0.0;
    }
    float _125 = _123;
    bool _127 = !_109;
    float _129 = _125;
    if (!_127)
    {
        float _131 = in.m_27.z;
        float _133 = gl_FragCoord.w;
        float _135 = _131 * _133;
        float _137 = in.m_27.x;
        float _139 = gl_FragCoord.w;
        float _141 = _137 * _139;
        float _143 = 1.0 / _97;
        float _145 = abs(_97);
        float _147 = _145 * 1.42999994754791259765625;
        bool _149 = _97 >= 0.0;
        bool _151 = isnan(_97);
        bool _153 = _149 || _151;
        bool _155 = isnan(0.0);
        bool _157 = _153 || _155;
        float _159 = _147 * _147;
        float _161 = _159 * _159;
        float _163 = fma(_159, _161, 1.0);
        int _165 = _157 ? 0 : 1;
        float _167 = _38 * _143;
        bool _169 = _97 > 0.001000000047497451305389404296875;
        float _171 = _40 * _143;
        float _173 = 1.0 / _163;
        int _175 = ~_165;
        int _177 = _175 + 1;
        int _179 = _177 + 1;
        float _181 = _169 ? _167 : 0.0;
        int _183 = _179;
        if (!_101)
        {
            int _185 = ~_165;
            int _187 = _185 + 1;
            _183 = _187;
        }
        int _189 = _183;
        float _191 = _169 ? _171 : 1.0;
        float _193 = float(_189);
        float _195 = _89 * _135;
        float _197 = _89 * _141;
        float _199 = _181 * _195;
        float _201 = _147 * _173;
        float _203 = fma(_191, _197, _199);
        float _205 = _193 * _203;
        float _207 = _205 * _201;
        _129 = _207;
    }
    float _209 = _129;
    float _211 = -_121;
    float _213 = _211 + _209;
    out.m_20.x = _213;
    out.m_20.y = _213;
    out.m_20.z = _213;
    out.m_20.w = _213;
    return out;
}


struct main0_out_u
{
    uint4 m_20 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], float2 gl_PointCoord [[point_coord]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_PointCoord.y;
    float _36 = gl_PointCoord.x;
    float _38 = fma(_34, 2.0, -1.0);
    float _40 = fma(_36, 2.0, -1.0);
    float _42 = _38 * _38;
    float _44 = fma(_40, _40, _42);
    bool _48 = _44 > 1.0;
    int _51 = as_type<int>(_36);
    int _53 = as_type<int>(_42);
    if (_48)
    {
        _51 = 0;
        _53 = 0;
    }
    int _55 = _51;
    int _57 = _53;
    int _59 = 0;
    int _61 = 0;
    if (_48)
    {
        _59 = 0;
        _61 = 0;
    }
    int _63 = _59;
    int _65 = _61;
    if (_48)
    {
        out.m_20.x = as_type<float>(_55);
        out.m_20.y = as_type<float>(_57);
        out.m_20.z = as_type<float>(_63);
        out.m_20.w = as_type<float>(_65);
        return main0_out_u{as_type<uint4>(out.m_20)};
    }
    float _67 = gl_FragCoord.w;
    float _69 = in.m_25.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_25.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = sqrt(_44);
    float _83 = in.m_27.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _67;
    float _91 = _89 * _73;
    float _93 = _89 * _79;
    float _95 = -_91;
    float _97 = fma(_81, _93, _95);
    float _99 = _97 * 0.834999978542327880859375;
    bool _101 = _97 > 0.0;
    float _103 = _99 * _99;
    float _105 = -_91;
    bool _107 = _97 < _105;
    bool _109 = _107 || _101;
    float _111 = _89 * _87;
    float _113 = _103 * _103;
    float _115 = fma(_103, _113, 1.0);
    float _117 = 1.0 / _115;
    float _119 = _99 * _117;
    float _121 = _111 * _119;
    float _123 = _119;
    if (!_109)
    {
        _123 = 0.0;
    }
    float _125 = _123;
    bool _127 = !_109;
    float _129 = _125;
    if (!_127)
    {
        float _131 = in.m_27.z;
        float _133 = gl_FragCoord.w;
        float _135 = _131 * _133;
        float _137 = in.m_27.x;
        float _139 = gl_FragCoord.w;
        float _141 = _137 * _139;
        float _143 = 1.0 / _97;
        float _145 = abs(_97);
        float _147 = _145 * 1.42999994754791259765625;
        bool _149 = _97 >= 0.0;
        bool _151 = isnan(_97);
        bool _153 = _149 || _151;
        bool _155 = isnan(0.0);
        bool _157 = _153 || _155;
        float _159 = _147 * _147;
        float _161 = _159 * _159;
        float _163 = fma(_159, _161, 1.0);
        int _165 = _157 ? 0 : 1;
        float _167 = _38 * _143;
        bool _169 = _97 > 0.001000000047497451305389404296875;
        float _171 = _40 * _143;
        float _173 = 1.0 / _163;
        int _175 = ~_165;
        int _177 = _175 + 1;
        int _179 = _177 + 1;
        float _181 = _169 ? _167 : 0.0;
        int _183 = _179;
        if (!_101)
        {
            int _185 = ~_165;
            int _187 = _185 + 1;
            _183 = _187;
        }
        int _189 = _183;
        float _191 = _169 ? _171 : 1.0;
        float _193 = float(_189);
        float _195 = _89 * _135;
        float _197 = _89 * _141;
        float _199 = _181 * _195;
        float _201 = _147 * _173;
        float _203 = fma(_191, _197, _199);
        float _205 = _193 * _203;
        float _207 = _205 * _201;
        _129 = _207;
    }
    float _209 = _129;
    float _211 = -_121;
    float _213 = _211 + _209;
    out.m_20.x = _213;
    out.m_20.y = _213;
    out.m_20.z = _213;
    out.m_20.w = _213;
    return main0_out_u{as_type<uint4>(out.m_20)};
}

