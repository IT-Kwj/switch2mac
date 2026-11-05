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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _901, thread const int& _902, constant _10& support_buffer)
{
    int _905 = 1 + _902;
    float _907 = support_buffer._m5[_905].x;
    float _909 = abs(_907);
    bool _911 = _909 == 1.0;
    if (_911)
    {
        return _901;
    }
    float _913 = float(_901);
    float _915 = _913 / _909;
    int _917 = int(_915);
    return _917;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _426 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_426, float2(0.0), isnan(_426))).x;
    float2 _437 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_437, float2(0.0), isnan(_437))).x;
    float _72 = in.m_35.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = _62 * _82;
    float _94 = _62 * _88;
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_70, _98);
    float _102 = precise::max(_100, _94);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    bool _116 = !_114;
    if (!_116)
    {
        float _118 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _120 = fma(_102, _118, 1.0);
        float _122 = log2(_120);
        float _124 = _122 + (-1.0);
        float _126 = trunc(_124);
        int _128 = int(_126);
        int _130 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).x;
        int _132 = _130;
        int _134 = 2;
        int _136 = _44(_132, _134, (*spvDescriptorSet0.support_buffer));
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_128), spvDescriptorSet0.fp_t_tcb_A.get_height(_128)).y;
        int _140 = _138;
        int _142 = 2;
        int _144 = _44(_140, _142, (*spvDescriptorSet0.support_buffer));
        float _146 = float(_136);
        float _148 = float(_144);
        float _150 = fma(_64, _146, -0.5);
        float _152 = fma(_66, _148, -0.5);
        float _154 = floor(_150);
        float _156 = floor(_152);
        float _158 = -_154;
        float _160 = _150 + _158;
        float _162 = 1.0 / _148;
        float _164 = -_160;
        float _166 = _164 + 1.0;
        float _168 = -_160;
        float _170 = _168 + 2.0;
        float _172 = -_156;
        float _174 = _152 + _172;
        float _176 = _166 * _166;
        float _178 = _156 + (-0.5);
        float _180 = _156 + 1.5;
        float _182 = -_174;
        float _184 = _182 + 1.0;
        float _186 = _166 * _176;
        float _188 = -_174;
        float _190 = _188 + 2.0;
        float _192 = _170 * _170;
        float _194 = _184 * _184;
        float _196 = 1.0 / _146;
        float _198 = _190 * _190;
        float _200 = _184 * _194;
        float _202 = _186 * 4.0;
        float _204 = _200 * 4.0;
        float _206 = -_202;
        float _208 = fma(_170, _192, _206);
        float _210 = -_186;
        float _212 = _210 + 6.0;
        float _214 = -_204;
        float _216 = fma(_190, _198, _214);
        float _218 = -_200;
        float _220 = _218 + 6.0;
        float _222 = -_208;
        float _224 = _222 + _212;
        float _226 = _186 + _208;
        float _228 = _200 + _216;
        float _230 = -_216;
        float _232 = _230 + _220;
        float _234 = _224 * 0.16666667163372039794921875;
        float _236 = _226 * 0.16666667163372039794921875;
        float _238 = _228 * 0.16666667163372039794921875;
        float _240 = _232 * 0.16666667163372039794921875;
        float _242 = _160 * _160;
        float _244 = 1.0 / _236;
        float _246 = _174 * _174;
        float _248 = _216 * 0.16666667163372039794921875;
        float _250 = _160 * _242;
        float _252 = _208 * 0.16666667163372039794921875;
        float _254 = _174 * _246;
        float _256 = _154 + (-0.5);
        float _258 = _154 + 1.5;
        float _260 = 1.0 / _238;
        float _262 = _250 * 0.16666667163372039794921875;
        float _264 = _254 * 0.16666667163372039794921875;
        float _266 = 1.0 / _234;
        float _268 = fma(_252, _244, _256);
        float _270 = 1.0 / _240;
        float _272 = fma(_248, _260, _178);
        float _274 = fma(_262, _266, _258);
        float _276 = _272 * _162;
        float _278 = fma(_264, _270, _180);
        float _280 = _268 * _196;
        float _282 = _274 * _196;
        float _284 = _278 * _162;
        float2 _720 = float2(_280, _276);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_720, float2(0.0), isnan(_720)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_720, float2(0.0), isnan(_720)), level(_124)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float2 _735 = float2(_282, _276);
        float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_735, float2(0.0), isnan(_735)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_735, float2(0.0), isnan(_735)), level(_124)).xyz;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float2 _750 = float2(_280, _284);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_750, float2(0.0), isnan(_750)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_750, float2(0.0), isnan(_750)), level(_124)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _765 = float2(_282, _284);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_765, float2(0.0), isnan(_765)), level(_124)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_765, float2(0.0), isnan(_765)), level(_124)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float _320 = 0.0 + _122;
        float _322 = precise::clamp(_320, 0.0, 1.0);
        float _324 = fma(_92, _322, _90);
        float _326 = _322 * _92;
        float _328 = 1.0 / _324;
        float _330 = -_302;
        float _332 = _294 + _330;
        float _334 = -_298;
        float _336 = _290 + _334;
        float _338 = -_318;
        float _340 = _310 + _338;
        float _342 = fma(_236, _332, _302);
        float _344 = -_314;
        float _346 = _306 + _344;
        float _348 = -_300;
        float _350 = _292 + _348;
        float _352 = -_316;
        float _354 = _308 + _352;
        float _356 = fma(_236, _340, _318);
        float _358 = fma(_236, _336, _298);
        float _360 = fma(_236, _346, _314);
        float _362 = fma(_236, _350, _300);
        float _364 = fma(_236, _354, _316);
        float _366 = -_356;
        float _368 = _366 + _342;
        float _370 = -_360;
        float _372 = _370 + _358;
        float _374 = _328 * _326;
        float _376 = -_364;
        float _378 = _376 + _362;
        float _380 = fma(_238, _368, _356);
        float _382 = fma(_238, _372, _360);
        float _384 = fma(_238, _378, _364);
        float _386 = _380 * _326;
        float _388 = _382 * _374;
        float _390 = _384 * _374;
        float _392 = _386 * _328;
        out.m_38.x = _388;
        out.m_38.y = _390;
        out.m_38.z = _392;
        out.m_38.w = _324;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _90;
    return out;
}

