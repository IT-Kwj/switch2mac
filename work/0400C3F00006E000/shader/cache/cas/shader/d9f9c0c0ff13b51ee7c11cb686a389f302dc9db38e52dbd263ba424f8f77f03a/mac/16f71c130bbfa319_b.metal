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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _845, thread const int& _846, constant _10& support_buffer)
{
    int _849 = 1 + _846;
    float _851 = support_buffer._m5[_849].x;
    float _853 = abs(_851);
    bool _855 = _853 == 1.0;
    if (_855)
    {
        return _845;
    }
    float _857 = float(_845);
    float _859 = _857 / _853;
    int _861 = int(_859);
    return _861;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _406 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = precise::max(_94, _90);
    bool _100 = _96 != 0.0;
    bool _102 = isnan(_96);
    bool _104 = _100 || _102;
    bool _106 = isnan(0.0);
    bool _108 = _104 || _106;
    bool _110 = !_108;
    if (!_110)
    {
        float _112 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _114 = fma(_96, _112, 1.0);
        float _116 = log2(_114);
        float _118 = _116 + (-1.0);
        float _120 = trunc(_118);
        int _122 = int(_120);
        int _124 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).x;
        int _126 = _124;
        int _128 = 1;
        int _130 = _42(_126, _128, (*spvDescriptorSet0.support_buffer));
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_122), spvDescriptorSet0.fp_t_tcb_A.get_height(_122)).y;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        float _140 = float(_130);
        float _142 = float(_138);
        float _144 = fma(_62, _140, -0.5);
        float _146 = fma(_64, _142, -0.5);
        float _148 = 1.0 / _140;
        float _150 = floor(_144);
        float _152 = floor(_146);
        float _154 = -_150;
        float _156 = _144 + _154;
        float _158 = -_156;
        float _160 = _158 + 1.0;
        float _162 = -_156;
        float _164 = _162 + 2.0;
        float _166 = -_152;
        float _168 = _146 + _166;
        float _170 = _160 * _160;
        float _172 = _164 * _164;
        float _174 = -_168;
        float _176 = _174 + 1.0;
        float _178 = _160 * _170;
        float _180 = -_168;
        float _182 = _180 + 2.0;
        float _184 = _176 * _176;
        float _186 = _182 * _182;
        float _188 = _176 * _184;
        float _190 = _178 * 4.0;
        float _192 = _188 * 4.0;
        float _194 = -_190;
        float _196 = fma(_164, _172, _194);
        float _198 = -_188;
        float _200 = _198 + 6.0;
        float _202 = -_178;
        float _204 = _202 + 6.0;
        float _206 = -_192;
        float _208 = fma(_182, _186, _206);
        float _210 = 1.0 / _142;
        float _212 = -_196;
        float _214 = _212 + _204;
        float _216 = -_208;
        float _218 = _216 + _200;
        float _220 = _214 * 0.16666667163372039794921875;
        float _222 = _218 * 0.16666667163372039794921875;
        float _224 = _188 + _208;
        float _226 = _178 + _196;
        float _228 = _156 * _156;
        float _230 = _168 * _168;
        float _232 = _224 * 0.16666667163372039794921875;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = 1.0 / _220;
        float _238 = _156 * _228;
        float _240 = _168 * _230;
        float _242 = _152 + (-0.5);
        float _244 = _208 * 0.16666667163372039794921875;
        float _246 = _150 + (-0.5);
        float _248 = _152 + 1.5;
        float _250 = _150 + 1.5;
        float _252 = 1.0 / _232;
        float _254 = _196 * 0.16666667163372039794921875;
        float _256 = _238 * 0.16666667163372039794921875;
        float _258 = _240 * 0.16666667163372039794921875;
        float _260 = 1.0 / _234;
        float _262 = 1.0 / _222;
        float _264 = fma(_244, _252, _242);
        float _266 = fma(_256, _236, _250);
        float _268 = _264 * _210;
        float _270 = _266 * _148;
        float _272 = fma(_254, _260, _246);
        float _274 = _272 * _148;
        float _276 = fma(_258, _262, _248);
        float _278 = _276 * _210;
        float2 _689 = float2(_274, _268);
        float3 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_689, float2(0.0), isnan(_689)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_689, float2(0.0), isnan(_689)), level(_118)).xyz;
        float _284 = _282.x;
        float _286 = _282.y;
        float _288 = _282.z;
        float2 _704 = float2(_270, _268);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_704, float2(0.0), isnan(_704)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_704, float2(0.0), isnan(_704)), level(_118)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _719 = float2(_274, _278);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_719, float2(0.0), isnan(_719)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_719, float2(0.0), isnan(_719)), level(_118)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _734 = float2(_270, _278);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_734, float2(0.0), isnan(_734)), level(_118)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_734, float2(0.0), isnan(_734)), level(_118)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float _314 = 0.0 + _116;
        float _316 = precise::clamp(_314, 0.0, 1.0);
        float _318 = fma(_88, _316, _86);
        float _320 = -_292;
        float _322 = _284 + _320;
        float _324 = -_296;
        float _326 = _288 + _324;
        float _328 = -_294;
        float _330 = _286 + _328;
        float _332 = fma(_234, _322, _292);
        float _334 = fma(_234, _326, _296);
        float _336 = fma(_234, _330, _294);
        float _338 = -_308;
        float _340 = _300 + _338;
        float _342 = -_310;
        float _344 = _302 + _342;
        float _346 = -_312;
        float _348 = _304 + _346;
        float _350 = fma(_234, _340, _308);
        float _352 = fma(_234, _344, _310);
        float _354 = fma(_234, _348, _312);
        float _356 = -_350;
        float _358 = _356 + _332;
        float _360 = -_352;
        float _362 = _360 + _336;
        float _364 = -_354;
        float _366 = _364 + _334;
        float _368 = fma(_232, _358, _350);
        float _370 = fma(_232, _362, _352);
        float _372 = fma(_232, _366, _354);
        out.m_36.x = _368;
        out.m_36.y = _370;
        out.m_36.z = _372;
        out.m_36.w = _318;
        return out;
    }
    discard_fragment();
    return out;
}

