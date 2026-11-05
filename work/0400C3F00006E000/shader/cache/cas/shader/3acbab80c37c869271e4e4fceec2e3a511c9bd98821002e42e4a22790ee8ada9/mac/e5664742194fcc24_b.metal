#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d_ms<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _32(thread const int& _271, thread const int& _272, constant _10& support_buffer)
{
    int _275 = 1 + _272;
    float _277 = support_buffer._m5[_275].x;
    float _279 = abs(_277);
    bool _283 = _279 == 1.0;
    if (_283)
    {
        return _271;
    }
    float _285 = float(_271);
    float _287 = _285 / _279;
    int _289 = int(_287);
    return _289;
}

static inline __attribute__((always_inline))
int _34(thread const int& _313, thread const int& _314, thread const int& _315, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _318 = 1 + _314;
    float _320 = support_buffer._m5[_318].x;
    bool _322 = _320 == 1.0;
    if (_322)
    {
        return _313;
    }
    bool _324 = _320 < 0.0;
    if (_324)
    {
        float _326 = -_320;
        float _328 = float(_313);
        float _330 = _328 * _326;
        float _332 = gl_FragCoord.x;
        float _334 = gl_FragCoord.y;
        float _336 = (_315 != 0) ? _334 : _332;
        float _338 = mod(_336, _326);
        float _340 = _330 + _338;
        int _342 = int(_340);
        return _342;
    }
    float _344 = float(_313);
    float _346 = _344 * _320;
    int _348 = int(_346);
    return _348;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _37 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _39 = _37;
    int _41 = 0;
    int _43 = _32(_39, _41, (*spvDescriptorSet0.support_buffer));
    int _45 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _47 = _45;
    int _49 = 0;
    int _51 = _32(_47, _49, (*spvDescriptorSet0.support_buffer));
    float _54 = gl_FragCoord.w;
    float _56 = in.m_23.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_23.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float _74 = float(_43);
    float _76 = float(_51);
    float _78 = _70 * _74;
    float _80 = _72 * _76;
    float _82 = trunc(_78);
    int _84 = int(_82);
    float _86 = trunc(_80);
    int _88 = int(_86);
    int _90 = _84;
    int _92 = 0;
    int _94 = 0;
    int _96 = _34(_90, _92, _94, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _98 = _88;
    int _100 = 0;
    int _102 = 1;
    int _104 = _34(_98, _100, _102, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _108 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_96, _104)), 0).xyz;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    int _116 = _84;
    int _118 = 0;
    int _120 = 0;
    int _122 = _34(_116, _118, _120, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _124 = _88;
    int _126 = 0;
    int _128 = 1;
    int _130 = _34(_124, _126, _128, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _132 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_122, _130)), 1).xyz;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _134 + _110;
    float _142 = _136 + _112;
    float _144 = _138 + _114;
    float _146 = _140 * 0.5;
    float _148 = _142 * 0.5;
    float _150 = _144 * 0.5;
    out.m_26.x = _146;
    out.m_26.y = _148;
    out.m_26.z = _150;
    out.m_26.w = 1.0;
    return out;
}

