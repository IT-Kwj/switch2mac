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
int _32(thread const int& _383, thread const int& _384, constant _10& support_buffer)
{
    int _387 = 1 + _384;
    float _389 = support_buffer._m5[_387].x;
    float _391 = abs(_389);
    bool _395 = _391 == 1.0;
    if (_395)
    {
        return _383;
    }
    float _397 = float(_383);
    float _399 = _397 / _391;
    int _401 = int(_399);
    return _401;
}

static inline __attribute__((always_inline))
int _34(thread const int& _425, thread const int& _426, thread const int& _427, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _430 = 1 + _426;
    float _432 = support_buffer._m5[_430].x;
    bool _434 = _432 == 1.0;
    if (_434)
    {
        return _425;
    }
    bool _436 = _432 < 0.0;
    if (_436)
    {
        float _438 = -_432;
        float _440 = float(_425);
        float _442 = _440 * _438;
        float _444 = gl_FragCoord.x;
        float _446 = gl_FragCoord.y;
        float _448 = (_427 != 0) ? _446 : _444;
        float _450 = mod(_448, _438);
        float _452 = _442 + _450;
        int _454 = int(_452);
        return _454;
    }
    float _456 = float(_425);
    float _458 = _456 * _432;
    int _460 = int(_458);
    return _460;
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
    int _140 = _84;
    int _142 = 0;
    int _144 = 0;
    int _146 = _34(_140, _142, _144, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _148 = _88;
    int _150 = 0;
    int _152 = 1;
    int _154 = _34(_148, _150, _152, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _156 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_146, _154)), 2).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    int _164 = _84;
    int _166 = 0;
    int _168 = 0;
    int _170 = _34(_164, _166, _168, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _172 = _88;
    int _174 = 0;
    int _176 = 1;
    int _178 = _34(_172, _174, _176, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _180 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_170, _178)), 3).xyz;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _110 + _134;
    float _190 = _112 + _136;
    float _192 = _114 + _138;
    float _194 = _188 + _158;
    float _196 = _190 + _160;
    float _198 = _192 + _162;
    float _200 = _182 + _194;
    float _202 = _184 + _196;
    float _204 = _186 + _198;
    float _206 = _200 * 0.25;
    float _208 = _202 * 0.25;
    float _210 = _204 * 0.25;
    out.m_26.x = _206;
    out.m_26.y = _208;
    out.m_26.z = _210;
    out.m_26.w = 1.0;
    return out;
}

