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
};

fragment main0_out main0(main0_in in [[stage_in]], float2 gl_PointCoord [[point_coord]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_PointCoord.y;
    float _34 = gl_PointCoord.x;
    float _36 = fma(_32, 2.0, -1.0);
    float _38 = fma(_34, 2.0, -1.0);
    float _40 = _36 * _36;
    float _42 = fma(_38, _38, _40);
    bool _46 = _42 > 1.0;
    int _49 = as_type<int>(_38);
    int _51 = as_type<int>(_42);
    int _53 = 1073741824;
    if (_46)
    {
        _49 = 0;
        _51 = 0;
    }
    int _55 = _49;
    int _57 = _51;
    int _59 = 0;
    if (_46)
    {
        _53 = 0;
        _59 = 0;
    }
    int _61 = _53;
    int _63 = _59;
    if (_46)
    {
        out.m_20.x = as_type<float>(_55);
        out.m_20.y = as_type<float>(_57);
        out.m_20.z = as_type<float>(_61);
        out.m_20.w = as_type<float>(_63);
        return out;
    }
    float _65 = gl_FragCoord.w;
    float _67 = in.m_25.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _65;
    float _75 = _73 * _71;
    out.m_20.x = 0.0;
    out.m_20.y = 0.0;
    out.m_20.z = 0.0;
    out.m_20.w = _75;
    return out;
}


struct main0_out_u
{
    uint4 m_20 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], float2 gl_PointCoord [[point_coord]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _32 = gl_PointCoord.y;
    float _34 = gl_PointCoord.x;
    float _36 = fma(_32, 2.0, -1.0);
    float _38 = fma(_34, 2.0, -1.0);
    float _40 = _36 * _36;
    float _42 = fma(_38, _38, _40);
    bool _46 = _42 > 1.0;
    int _49 = as_type<int>(_38);
    int _51 = as_type<int>(_42);
    int _53 = 1073741824;
    if (_46)
    {
        _49 = 0;
        _51 = 0;
    }
    int _55 = _49;
    int _57 = _51;
    int _59 = 0;
    if (_46)
    {
        _53 = 0;
        _59 = 0;
    }
    int _61 = _53;
    int _63 = _59;
    if (_46)
    {
        out.m_20.x = as_type<float>(_55);
        out.m_20.y = as_type<float>(_57);
        out.m_20.z = as_type<float>(_61);
        out.m_20.w = as_type<float>(_63);
        return main0_out_u{as_type<uint4>(out.m_20)};
    }
    float _65 = gl_FragCoord.w;
    float _67 = in.m_25.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _65;
    float _75 = _73 * _71;
    out.m_20.x = 0.0;
    out.m_20.y = 0.0;
    out.m_20.z = 0.0;
    out.m_20.w = _75;
    return main0_out_u{as_type<uint4>(out.m_20)};
}

