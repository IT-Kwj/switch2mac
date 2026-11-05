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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
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
int _32(thread const int& _202, thread const int& _203, constant _10& support_buffer)
{
    int _206 = 1 + _203;
    float _208 = support_buffer._m5[_206].x;
    float _210 = abs(_208);
    bool _214 = _210 == 1.0;
    if (_214)
    {
        return _202;
    }
    float _216 = float(_202);
    float _218 = _216 / _210;
    int _220 = int(_218);
    return _220;
}

static inline __attribute__((always_inline))
int _34(thread const int& _244, thread const int& _245, thread const int& _246, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _249 = 1 + _245;
    float _251 = support_buffer._m5[_249].x;
    bool _253 = _251 == 1.0;
    if (_253)
    {
        return _244;
    }
    bool _255 = _251 < 0.0;
    if (_255)
    {
        float _257 = -_251;
        float _259 = float(_244);
        float _261 = _259 * _257;
        float _263 = gl_FragCoord.x;
        float _265 = gl_FragCoord.y;
        float _267 = (_246 != 0) ? _265 : _263;
        float _269 = mod(_267, _257);
        float _271 = _261 + _269;
        int _273 = int(_271);
        return _273;
    }
    float _275 = float(_244);
    float _277 = _275 * _251;
    int _279 = int(_277);
    return _279;
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
    float _74 = float(_51);
    float _76 = float(_43);
    float _78 = _72 * _74;
    float _80 = _70 * _76;
    float _82 = trunc(_80);
    int _84 = int(_82);
    float _86 = trunc(_78);
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
    out.m_26.x = _110;
    out.m_26.y = _112;
    out.m_26.z = _114;
    out.m_26.w = 1.0;
    return out;
}

