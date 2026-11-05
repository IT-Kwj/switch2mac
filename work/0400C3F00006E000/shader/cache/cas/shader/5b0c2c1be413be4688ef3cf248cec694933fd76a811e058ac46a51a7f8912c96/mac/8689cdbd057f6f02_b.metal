#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _875, thread const int& _876, constant _10& support_buffer)
{
    int _879 = 1 + _876;
    float _881 = support_buffer._m5[_879].x;
    float _883 = abs(_881);
    bool _885 = _883 == 1.0;
    if (_885)
    {
        return _875;
    }
    float _887 = float(_875);
    float _889 = _887 / _883;
    int _891 = int(_889);
    return _891;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _406 = float2(_60, _62);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).x;
    bool _68 = _64 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_68)
    {
        discard_fragment();
    }
    if (_68)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _70 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _72 = precise::clamp(_70, 0.0, 1.0);
    float _74 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _76 = precise::clamp(_74, 0.0, 1.0);
    float _78 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _80 = precise::clamp(_78, 0.0, 1.0);
    bool _82 = _72 != 0.0;
    bool _84 = isnan(_72);
    bool _86 = _82 || _84;
    bool _88 = isnan(0.0);
    bool _90 = _86 || _88;
    bool _92 = !_90;
    if (!_92)
    {
        float _94 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _96 = fma(_72, _94, 1.0);
        float _98 = log2(_96);
        float _100 = _98 + (-1.0);
        float _102 = trunc(_100);
        int _104 = int(_102);
        int _106 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_104), spvDescriptorSet0.fp_t_tcb_A.get_height(_104)).x;
        int _108 = _106;
        int _110 = 1;
        int _112 = _40(_108, _110, (*spvDescriptorSet0.support_buffer));
        int _114 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_104), spvDescriptorSet0.fp_t_tcb_A.get_height(_104)).y;
        int _116 = _114;
        int _118 = 1;
        int _120 = _40(_116, _118, (*spvDescriptorSet0.support_buffer));
        float _122 = float(_112);
        float _124 = float(_120);
        float _126 = fma(_60, _122, -0.5);
        float _128 = fma(_62, _124, -0.5);
        float _130 = 1.0 / _122;
        float _132 = floor(_126);
        float _134 = floor(_128);
        float _136 = -_132;
        float _138 = _126 + _136;
        float _140 = -_138;
        float _142 = _140 + 1.0;
        float _144 = -_138;
        float _146 = _144 + 2.0;
        float _148 = -_134;
        float _150 = _128 + _148;
        float _152 = _142 * _142;
        float _154 = _134 + 1.5;
        float _156 = -_150;
        float _158 = _156 + 1.0;
        float _160 = _142 * _152;
        float _162 = -_150;
        float _164 = _162 + 2.0;
        float _166 = _146 * _146;
        float _168 = _158 * _158;
        float _170 = -_160;
        float _172 = _170 + 6.0;
        float _174 = _164 * _164;
        float _176 = _158 * _168;
        float _178 = _160 * 4.0;
        float _180 = _176 * 4.0;
        float _182 = -_178;
        float _184 = fma(_146, _166, _182);
        float _186 = _150 * _150;
        float _188 = 1.0 / _124;
        float _190 = -_180;
        float _192 = fma(_164, _174, _190);
        float _194 = -_184;
        float _196 = _194 + _172;
        float _198 = -_176;
        float _200 = _198 + 6.0;
        float _202 = _150 * _186;
        float _204 = _176 + _192;
        float _206 = _196 * 0.16666667163372039794921875;
        float _208 = -_192;
        float _210 = _208 + _200;
        float _212 = _192 * 0.16666667163372039794921875;
        float _214 = _204 * 0.16666667163372039794921875;
        float _216 = 1.0 / _206;
        float _218 = _210 * 0.16666667163372039794921875;
        float _220 = _160 + _184;
        float _222 = _138 * _138;
        float _224 = _132 + (-0.5);
        float _226 = _132 + 1.5;
        float _228 = _220 * 0.16666667163372039794921875;
        float _230 = _138 * _222;
        float _232 = 1.0 / _214;
        float _234 = _184 * 0.16666667163372039794921875;
        float _236 = _202 * 0.16666667163372039794921875;
        float _238 = _230 * 0.16666667163372039794921875;
        float _240 = 1.0 / _228;
        float _242 = fma(_238, _216, _226);
        float _244 = 1.0 / _218;
        float _246 = fma(_234, _240, _224);
        float _248 = _134 + (-0.5);
        float _250 = _242 * _130;
        float _252 = fma(_212, _232, _248);
        float _254 = fma(_236, _244, _154);
        float _256 = _252 * _188;
        float _258 = _246 * _130;
        float _260 = _254 * _188;
        float2 _687 = float2(_258, _256);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_687, float2(0.0), isnan(_687)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_687, float2(0.0), isnan(_687)), level(_100)).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float2 _702 = float2(_250, _256);
        float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_702, float2(0.0), isnan(_702)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_702, float2(0.0), isnan(_702)), level(_100)).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        float2 _717 = float2(_258, _260);
        float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_717, float2(0.0), isnan(_717)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_717, float2(0.0), isnan(_717)), level(_100)).xyz;
        float _282 = _280.x;
        float _284 = _280.y;
        float _286 = _280.z;
        float2 _732 = float2(_250, _260);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_732, float2(0.0), isnan(_732)), level(_100)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_732, float2(0.0), isnan(_732)), level(_100)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float _296 = precise::min(_76, _80);
        float _298 = 0.0 + _98;
        float _300 = precise::clamp(_298, 0.0, 1.0);
        float _302 = -_276;
        float _304 = _268 + _302;
        float _306 = -_278;
        float _308 = _270 + _306;
        float _310 = -_274;
        float _312 = _266 + _310;
        float _314 = fma(_228, _304, _276);
        float _316 = -_290;
        float _318 = _282 + _316;
        float _320 = -_292;
        float _322 = _284 + _320;
        float _324 = -_294;
        float _326 = _286 + _324;
        float _328 = fma(_228, _312, _274);
        float _330 = fma(_228, _308, _278);
        float _332 = fma(_228, _318, _290);
        float _334 = fma(_228, _322, _292);
        float _336 = fma(_228, _326, _294);
        float _338 = -_332;
        float _340 = _338 + _328;
        float _342 = -_334;
        float _344 = _342 + _314;
        float _346 = -_336;
        float _348 = _346 + _330;
        float _350 = fma(_214, _340, _332);
        float _352 = fma(_214, _344, _334);
        float _354 = fma(_214, _348, _336);
        float _356 = -_350;
        float _358 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[13].x, _356);
        float _360 = -_352;
        float _362 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[13].y, _360);
        float _364 = -_354;
        float _366 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[13].z, _364);
        float _368 = fma(_296, _358, _350);
        float _370 = fma(_296, _362, _352);
        float _372 = fma(_296, _366, _354);
        out.m_34.x = _368;
        out.m_34.y = _370;
        out.m_34.z = _372;
        out.m_34.w = _300;
        return out;
    }
    discard_fragment();
    return out;
}

