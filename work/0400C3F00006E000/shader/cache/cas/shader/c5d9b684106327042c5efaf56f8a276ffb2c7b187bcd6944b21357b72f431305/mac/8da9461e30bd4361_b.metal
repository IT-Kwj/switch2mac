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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _500, thread const int& _501, thread const int& _502, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _505 = 1 + _501;
    float _507 = support_buffer._m5[_505].x;
    bool _511 = _507 == 1.0;
    if (_511)
    {
        return _500;
    }
    bool _513 = _507 < 0.0;
    if (_513)
    {
        float _515 = -_507;
        float _517 = float(_500);
        float _519 = _517 * _515;
        float _521 = gl_FragCoord.x;
        float _523 = gl_FragCoord.y;
        float _525 = (_502 != 0) ? _523 : _521;
        float _527 = mod(_525, _515);
        float _529 = _519 + _527;
        int _531 = int(_529);
        return _531;
    }
    float _533 = float(_500);
    float _535 = _533 * _507;
    int _537 = int(_535);
    return _537;
}

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = gl_FragCoord.x;
    float _46 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _48 = _44 / _46;
    float _50 = gl_FragCoord.y;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = 1.0 / _42;
    float _58 = _48 * _56;
    float _60 = _54 * _56;
    float _62 = trunc(_58);
    int _64 = int(_62);
    float _66 = trunc(_60);
    int _68 = int(_66);
    int _70 = _64 + (-1);
    int _72 = _64 + 1;
    int _74 = _68 + 1;
    int _76 = _70;
    int _78 = 0;
    int _80 = 0;
    int _82 = _38(_76, _78, _80, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _84 = _68;
    int _86 = 0;
    int _88 = 1;
    int _90 = _38(_84, _86, _88, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _94 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_82, _90)), 0).xy;
    float _96 = _94.x;
    float _98 = _94.y;
    int _100 = _72;
    int _102 = 0;
    int _104 = 0;
    int _106 = _38(_100, _102, _104, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _108 = _68;
    int _110 = 0;
    int _112 = 1;
    int _114 = _38(_108, _110, _112, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _116 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_106, _114)), 0).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    int _122 = _68 + (-1);
    int _124 = _64;
    int _126 = 0;
    int _128 = 0;
    int _130 = _38(_124, _126, _128, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _132 = _122;
    int _134 = 0;
    int _136 = 1;
    int _138 = _38(_132, _134, _136, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _140 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_130, _138)), 0).xy;
    float _142 = _140.x;
    float _144 = _140.y;
    int _146 = _64;
    int _148 = 0;
    int _150 = 0;
    int _152 = _38(_146, _148, _150, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _154 = _74;
    int _156 = 0;
    int _158 = 1;
    int _160 = _38(_154, _156, _158, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _162 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_152, _160)), 0).xy;
    float _164 = _162.x;
    float _166 = _162.y;
    int _168 = _64;
    int _170 = 1;
    int _172 = 0;
    int _174 = _38(_168, _170, _172, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _176 = _68;
    int _178 = 1;
    int _180 = 1;
    int _182 = _38(_176, _178, _180, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _184 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_174, _182)), 0).xy;
    float _186 = _184.x;
    float _188 = _184.y;
    int _190 = _64;
    int _192 = 0;
    int _194 = 0;
    int _196 = _38(_190, _192, _194, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _198 = _68;
    int _200 = 0;
    int _202 = 1;
    int _204 = _38(_198, _200, _202, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _206 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_196, _204)), 0).y;
    float _208 = -_120;
    float _210 = _98 + _208;
    float _212 = -_118;
    float _214 = _96 + _212;
    float _216 = _210 * _210;
    float _218 = _214 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _220 = -_144;
    float _222 = _220 + _166;
    float _224 = _188 * _188;
    float _226 = _206 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _228 = -_164;
    float _230 = _142 + _228;
    float _232 = fma(_222, _222, _216);
    float _234 = fma(_186, _186, _224);
    float _236 = _226 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _240 = sqrt(_232);
    float _242 = sqrt(_234);
    float _244 = spvFAdd(_240, 9.9999997473787516355514526367188e-06);
    float _246 = 1.0 / _244;
    float _248 = -_242;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].z, 1.0);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _236 * _252;
    float _256 = _246 * _254;
    float _258 = fma(_222, _256, _218);
    float _260 = fma(_210, _256, _238);
    float _262 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].w, _186);
    float _264 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].w, _188);
    out.m_32.x = _262;
    out.m_32.y = _264;
    return out;
}

