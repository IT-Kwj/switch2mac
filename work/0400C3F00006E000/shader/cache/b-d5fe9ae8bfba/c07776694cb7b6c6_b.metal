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
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _861, thread const int& _862, constant _10& support_buffer)
{
    int _865 = 1 + _862;
    float _867 = support_buffer._m5[_865].x;
    float _869 = abs(_867);
    bool _871 = _869 == 1.0;
    if (_871)
    {
        return _861;
    }
    float _873 = float(_861);
    float _875 = _873 / _869;
    int _877 = int(_875);
    return _877;
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
    float2 _408 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = _60 * _76;
    float _96 = precise::max(_92, _94);
    float _98 = _60 * _82;
    float _100 = _60 * _88;
    bool _102 = _96 != 0.0;
    bool _104 = isnan(_96);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    bool _112 = !_110;
    if (!_112)
    {
        float _114 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _116 = fma(_96, _114, 1.0);
        float _118 = log2(_116);
        float _120 = _118 + (-1.0);
        float _122 = trunc(_120);
        int _124 = int(_122);
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).x;
        int _128 = _126;
        int _130 = 1;
        int _132 = _42(_128, _130, (*spvDescriptorSet0.support_buffer));
        int _134 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_124), spvDescriptorSet0.fp_t_tcb_A.get_height(_124)).y;
        int _136 = _134;
        int _138 = 1;
        int _140 = _42(_136, _138, (*spvDescriptorSet0.support_buffer));
        float _142 = float(_132);
        float _144 = float(_140);
        float _146 = fma(_62, _142, -0.5);
        float _148 = fma(_64, _144, -0.5);
        float _150 = 1.0 / _142;
        float _152 = floor(_146);
        float _154 = floor(_148);
        float _156 = -_152;
        float _158 = _146 + _156;
        float _160 = -_158;
        float _162 = _160 + 1.0;
        float _164 = -_158;
        float _166 = _164 + 2.0;
        float _168 = -_154;
        float _170 = _148 + _168;
        float _172 = _162 * _162;
        float _174 = _166 * _166;
        float _176 = -_170;
        float _178 = _176 + 1.0;
        float _180 = _162 * _172;
        float _182 = -_170;
        float _184 = _182 + 2.0;
        float _186 = _178 * _178;
        float _188 = _184 * _184;
        float _190 = _178 * _186;
        float _192 = _180 * 4.0;
        float _194 = _190 * 4.0;
        float _196 = -_192;
        float _198 = fma(_166, _174, _196);
        float _200 = -_190;
        float _202 = _200 + 6.0;
        float _204 = -_180;
        float _206 = _204 + 6.0;
        float _208 = -_194;
        float _210 = fma(_184, _188, _208);
        float _212 = 1.0 / _144;
        float _214 = -_198;
        float _216 = _214 + _206;
        float _218 = -_210;
        float _220 = _218 + _202;
        float _222 = _216 * 0.16666667163372039794921875;
        float _224 = _220 * 0.16666667163372039794921875;
        float _226 = _190 + _210;
        float _228 = _180 + _198;
        float _230 = _158 * _158;
        float _232 = _170 * _170;
        float _234 = _226 * 0.16666667163372039794921875;
        float _236 = _228 * 0.16666667163372039794921875;
        float _238 = 1.0 / _222;
        float _240 = _158 * _230;
        float _242 = _170 * _232;
        float _244 = _154 + (-0.5);
        float _246 = _210 * 0.16666667163372039794921875;
        float _248 = _152 + (-0.5);
        float _250 = _154 + 1.5;
        float _252 = _152 + 1.5;
        float _254 = 1.0 / _234;
        float _256 = _198 * 0.16666667163372039794921875;
        float _258 = _240 * 0.16666667163372039794921875;
        float _260 = _242 * 0.16666667163372039794921875;
        float _262 = 1.0 / _236;
        float _264 = 1.0 / _224;
        float _266 = fma(_246, _254, _244);
        float _268 = fma(_258, _238, _252);
        float _270 = _266 * _212;
        float _272 = _268 * _150;
        float _274 = fma(_256, _262, _248);
        float _276 = _274 * _150;
        float _278 = fma(_260, _264, _250);
        float _280 = _278 * _212;
        float2 _706 = float2(_276, _270);
        float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_706, float2(0.0), isnan(_706)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_706, float2(0.0), isnan(_706)), level(_120)).xyz;
        float _286 = _284.x;
        float _288 = _284.y;
        float _290 = _284.z;
        float2 _721 = float2(_272, _270);
        float3 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_721, float2(0.0), isnan(_721)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_721, float2(0.0), isnan(_721)), level(_120)).xyz;
        float _294 = _292.x;
        float _296 = _292.y;
        float _298 = _292.z;
        float2 _736 = float2(_276, _280);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_736, float2(0.0), isnan(_736)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_736, float2(0.0), isnan(_736)), level(_120)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _751 = float2(_272, _280);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_751, float2(0.0), isnan(_751)), level(_120)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_751, float2(0.0), isnan(_751)), level(_120)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float _316 = 0.0 + _118;
        float _318 = precise::clamp(_316, 0.0, 1.0);
        float _320 = fma(_100, _318, _98);
        float _322 = -_294;
        float _324 = _286 + _322;
        float _326 = -_298;
        float _328 = _290 + _326;
        float _330 = -_296;
        float _332 = _288 + _330;
        float _334 = fma(_236, _324, _294);
        float _336 = fma(_236, _328, _298);
        float _338 = fma(_236, _332, _296);
        float _340 = -_310;
        float _342 = _302 + _340;
        float _344 = -_312;
        float _346 = _304 + _344;
        float _348 = -_314;
        float _350 = _306 + _348;
        float _352 = fma(_236, _342, _310);
        float _354 = fma(_236, _346, _312);
        float _356 = fma(_236, _350, _314);
        float _358 = -_352;
        float _360 = _358 + _334;
        float _362 = -_354;
        float _364 = _362 + _338;
        float _366 = -_356;
        float _368 = _366 + _336;
        float _370 = fma(_234, _360, _352);
        float _372 = fma(_234, _364, _354);
        float _374 = fma(_234, _368, _356);
        out.m_34.x = _370;
        out.m_34.y = _372;
        out.m_34.z = _374;
        out.m_34.w = _320;
        return out;
    }
    discard_fragment();
    return out;
}

