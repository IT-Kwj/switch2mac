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
    float4 m_23 [[user(locn0), flat]];
    float4 m_18 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _30 = gl_FragCoord.w;
    float _32 = in.m_18.y;
    float _34 = gl_FragCoord.w;
    float _36 = _32 * _34;
    float _38 = in.m_18.x;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = 1.0 / _30;
    float _46 = _44 * _36;
    float _48 = _44 * _42;
    float _50 = fma(_46, 2.0, -1.0);
    float _52 = fma(_48, 2.0, -1.0);
    float _54 = _50 * _50;
    float _56 = fma(_52, _52, _54);
    bool _60 = _56 > 1.0;
    int _63 = as_type<int>(_52);
    int _65 = as_type<int>(_56);
    int _67 = as_type<int>(_44);
    int _69 = as_type<int>(_42);
    if (_60)
    {
        _63 = 0;
        _65 = 0;
    }
    int _71 = _63;
    int _73 = _65;
    if (_60)
    {
        _67 = 0;
        _69 = 0;
    }
    int _75 = _67;
    int _77 = _69;
    if (_60)
    {
        out.m_21.x = as_type<float>(_71);
        out.m_21.y = as_type<float>(_73);
        out.m_21.z = as_type<float>(_75);
        out.m_21.w = as_type<float>(_77);
        return out;
    }
    float _79 = in.m_23.y;
    out.m_21.x = 0.0;
    out.m_21.y = 0.0;
    out.m_21.z = 0.0;
    out.m_21.w = _79;
    return out;
}


struct main0_out_u
{
    uint4 m_21 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _30 = gl_FragCoord.w;
    float _32 = in.m_18.y;
    float _34 = gl_FragCoord.w;
    float _36 = _32 * _34;
    float _38 = in.m_18.x;
    float _40 = gl_FragCoord.w;
    float _42 = _38 * _40;
    float _44 = 1.0 / _30;
    float _46 = _44 * _36;
    float _48 = _44 * _42;
    float _50 = fma(_46, 2.0, -1.0);
    float _52 = fma(_48, 2.0, -1.0);
    float _54 = _50 * _50;
    float _56 = fma(_52, _52, _54);
    bool _60 = _56 > 1.0;
    int _63 = as_type<int>(_52);
    int _65 = as_type<int>(_56);
    int _67 = as_type<int>(_44);
    int _69 = as_type<int>(_42);
    if (_60)
    {
        _63 = 0;
        _65 = 0;
    }
    int _71 = _63;
    int _73 = _65;
    if (_60)
    {
        _67 = 0;
        _69 = 0;
    }
    int _75 = _67;
    int _77 = _69;
    if (_60)
    {
        out.m_21.x = as_type<float>(_71);
        out.m_21.y = as_type<float>(_73);
        out.m_21.z = as_type<float>(_75);
        out.m_21.w = as_type<float>(_77);
        return main0_out_u{as_type<uint4>(out.m_21)};
    }
    float _79 = in.m_23.y;
    out.m_21.x = 0.0;
    out.m_21.y = 0.0;
    out.m_21.z = 0.0;
    out.m_21.w = _79;
    return main0_out_u{as_type<uint4>(out.m_21)};
}

