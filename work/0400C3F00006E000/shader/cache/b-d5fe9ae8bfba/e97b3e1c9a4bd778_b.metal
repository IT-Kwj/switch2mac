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
    float4 m_21 [[color(0)]];
};

struct main0_in
{
    float4 m_18 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _28 = gl_FragCoord.w;
    float _30 = in.m_18.z;
    float _32 = gl_FragCoord.w;
    float _34 = _30 * _32;
    float _36 = 1.0 / _28;
    float _38 = _36 * _34;
    bool _42 = _38 != 0.0;
    bool _44 = isnan(_38);
    bool _46 = _42 || _44;
    bool _48 = isnan(0.0);
    bool _50 = _46 || _48;
    int _53 = 0;
    if (_50)
    {
        _53 = as_type<int>(_38);
    }
    int _55 = _53;
    int _57 = 0;
    if (_50)
    {
        _57 = 0;
    }
    int _59 = _57;
    int _61 = 0;
    if (_50)
    {
        _61 = 0;
    }
    int _63 = _61;
    int _65 = 0;
    if (_50)
    {
        _65 = 1065353216;
    }
    int _67 = _65;
    if (_50)
    {
        out.m_21.x = as_type<float>(_55);
        out.m_21.y = as_type<float>(_63);
        out.m_21.z = as_type<float>(_59);
        out.m_21.w = as_type<float>(_67);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_21 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _28 = gl_FragCoord.w;
    float _30 = in.m_18.z;
    float _32 = gl_FragCoord.w;
    float _34 = _30 * _32;
    float _36 = 1.0 / _28;
    float _38 = _36 * _34;
    bool _42 = _38 != 0.0;
    bool _44 = isnan(_38);
    bool _46 = _42 || _44;
    bool _48 = isnan(0.0);
    bool _50 = _46 || _48;
    int _53 = 0;
    if (_50)
    {
        _53 = as_type<int>(_38);
    }
    int _55 = _53;
    int _57 = 0;
    if (_50)
    {
        _57 = 0;
    }
    int _59 = _57;
    int _61 = 0;
    if (_50)
    {
        _61 = 0;
    }
    int _63 = _61;
    int _65 = 0;
    if (_50)
    {
        _65 = 1065353216;
    }
    int _67 = _65;
    if (_50)
    {
        out.m_21.x = as_type<float>(_55);
        out.m_21.y = as_type<float>(_63);
        out.m_21.z = as_type<float>(_59);
        out.m_21.w = as_type<float>(_67);
        return main0_out_u{as_type<uint4>(out.m_21)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_21)};
}

