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
    float4 m_24 [[color(0)]];
};

static inline __attribute__((always_inline))
int _30(thread const int& _281, thread const int& _282, thread const int& _283, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _286 = 1 + _282;
    float _288 = support_buffer._m5[_286].x;
    bool _292 = _288 == 1.0;
    if (_292)
    {
        return _281;
    }
    bool _294 = _288 < 0.0;
    if (_294)
    {
        float _296 = -_288;
        float _298 = float(_281);
        float _300 = _298 * _296;
        float _302 = gl_FragCoord.x;
        float _304 = gl_FragCoord.y;
        float _306 = (_283 != 0) ? _304 : _302;
        float _308 = mod(_306, _296);
        float _310 = _300 + _308;
        int _312 = int(_310);
        return _312;
    }
    float _314 = float(_281);
    float _316 = _314 * _288;
    int _318 = int(_316);
    return _318;
}

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _34 = gl_FragCoord.w;
    float _36 = gl_FragCoord.x;
    float _38 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _40 = _36 / _38;
    float _42 = gl_FragCoord.y;
    float _44 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _46 = _42 / _44;
    float _48 = 1.0 / _34;
    float _50 = _40 * _48;
    float _52 = _46 * _48;
    float _54 = trunc(_50);
    int _56 = int(_54);
    float _58 = trunc(_52);
    int _60 = int(_58);
    int _62 = _56 + (-1);
    int _64 = _56 + 1;
    int _66 = _60 + 1;
    int _68 = _62;
    int _70 = 0;
    int _72 = 0;
    int _74 = _30(_68, _70, _72, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _76 = _60;
    int _78 = 0;
    int _80 = 1;
    int _82 = _30(_76, _78, _80, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _84 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_74, _82)), 0).x;
    int _86 = _64;
    int _88 = 0;
    int _90 = 0;
    int _92 = _30(_86, _88, _90, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _94 = _60;
    int _96 = 0;
    int _98 = 1;
    int _100 = _30(_94, _96, _98, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _102 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_92, _100)), 0).x;
    int _104 = _60 + (-1);
    int _106 = _56;
    int _108 = 0;
    int _110 = 0;
    int _112 = _30(_106, _108, _110, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _114 = _66;
    int _116 = 0;
    int _118 = 1;
    int _120 = _30(_114, _116, _118, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _122 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_112, _120)), 0).y;
    int _124 = _56;
    int _126 = 0;
    int _128 = 0;
    int _130 = _30(_124, _126, _128, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _132 = _104;
    int _134 = 0;
    int _136 = 1;
    int _138 = _30(_132, _134, _136, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _140 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_130, _138)), 0).y;
    float _142 = -_84;
    float _144 = _142 + _102;
    float _146 = -_140;
    float _148 = _122 + _146;
    float _150 = _144 + _148;
    float _152 = -_148;
    float _154 = _144 + _152;
    float _156 = _150 * 0.5;
    float _158 = _154 * 0.5;
    out.m_24.x = _156;
    out.m_24.y = _158;
    return out;
}

