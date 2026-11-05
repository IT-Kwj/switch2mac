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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

static inline __attribute__((always_inline))
int _46(thread const int& _846, thread const int& _847, constant _10& support_buffer)
{
    int _850 = 1 + _847;
    float _852 = support_buffer._m5[_850].x;
    float _854 = abs(_852);
    bool _856 = _854 == 1.0;
    if (_856)
    {
        return _846;
    }
    float _858 = float(_846);
    float _860 = _858 / _854;
    int _862 = int(_860);
    return _862;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_33.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_33.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _408 = float2(_66, _68);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).x;
    float2 _419 = float2(_66, _68);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_419, float2(0.0), isnan(_419))).x;
    float _74 = in.m_35.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_37.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _64 * _78;
    float _88 = _64 * _84;
    float _90 = fma(_70, _86, _88);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    bool _96 = _70 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _98 = !_96;
    float _100 = _98 ? _92 : 0.0;
    float _102 = precise::max(_72, _100);
    bool _104 = _102 != 0.0;
    bool _106 = isnan(_102);
    bool _108 = _104 || _106;
    bool _110 = isnan(0.0);
    bool _112 = _108 || _110;
    bool _114 = !_112;
    if (!_114)
    {
        float _116 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _118 = fma(_102, _116, 1.0);
        float _120 = log2(_118);
        float _122 = _120 + (-1.0);
        float _124 = trunc(_122);
        int _126 = int(_124);
        int _128 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_126), spvDescriptorSet0.fp_t_tcb_A.get_height(_126)).x;
        int _130 = _128;
        int _132 = 2;
        int _134 = _46(_130, _132, (*spvDescriptorSet0.support_buffer));
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_126), spvDescriptorSet0.fp_t_tcb_A.get_height(_126)).y;
        int _138 = _136;
        int _140 = 2;
        int _142 = _46(_138, _140, (*spvDescriptorSet0.support_buffer));
        float _144 = float(_134);
        float _146 = float(_142);
        float _148 = fma(_66, _144, -0.5);
        float _150 = fma(_68, _146, -0.5);
        float _152 = 1.0 / _144;
        float _154 = floor(_148);
        float _156 = floor(_150);
        float _158 = -_154;
        float _160 = _148 + _158;
        float _162 = 1.0 / _146;
        float _164 = -_160;
        float _166 = _164 + 1.0;
        float _168 = -_160;
        float _170 = _168 + 2.0;
        float _172 = -_156;
        float _174 = _150 + _172;
        float _176 = _166 * _166;
        float _178 = -_174;
        float _180 = _178 + 1.0;
        float _182 = _166 * _176;
        float _184 = -_174;
        float _186 = _184 + 2.0;
        float _188 = _170 * _170;
        float _190 = _180 * _180;
        float _192 = _182 * 4.0;
        float _194 = _180 * _190;
        float _196 = _186 * _186;
        float _198 = -_192;
        float _200 = fma(_170, _188, _198);
        float _202 = -_182;
        float _204 = _202 + 6.0;
        float _206 = _194 * 4.0;
        float _208 = -_194;
        float _210 = _208 + 6.0;
        float _212 = _160 * _160;
        float _214 = -_200;
        float _216 = _214 + _204;
        float _218 = -_206;
        float _220 = fma(_186, _196, _218);
        float _222 = _174 * _174;
        float _224 = _160 * _212;
        float _226 = _216 * 0.16666667163372039794921875;
        float _228 = -_220;
        float _230 = _228 + _210;
        float _232 = _182 + _200;
        float _234 = _174 * _222;
        float _236 = _156 + (-0.5);
        float _238 = _230 * 0.16666667163372039794921875;
        float _240 = _194 + _220;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = 1.0 / _226;
        float _246 = _220 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = _154 + (-0.5);
        float _252 = _200 * 0.16666667163372039794921875;
        float _254 = _154 + 1.5;
        float _256 = _156 + 1.5;
        float _258 = _224 * 0.16666667163372039794921875;
        float _260 = 1.0 / _248;
        float _262 = _234 * 0.16666667163372039794921875;
        float _264 = 1.0 / _242;
        float _266 = fma(_258, _244, _254);
        float _268 = 1.0 / _238;
        float _270 = fma(_246, _260, _236);
        float _272 = _266 * _152;
        float _274 = _270 * _162;
        float _276 = fma(_252, _264, _250);
        float _278 = _276 * _152;
        float _280 = fma(_262, _268, _256);
        float _282 = _280 * _162;
        float2 _694 = float2(_278, _274);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_694, float2(0.0), isnan(_694)), level(_122)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_694, float2(0.0), isnan(_694)), level(_122)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float2 _709 = float2(_272, _274);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_709, float2(0.0), isnan(_709)), level(_122)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_709, float2(0.0), isnan(_709)), level(_122)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _724 = float2(_278, _282);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_724, float2(0.0), isnan(_724)), level(_122)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_724, float2(0.0), isnan(_724)), level(_122)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _739 = float2(_272, _282);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_739, float2(0.0), isnan(_739)), level(_122)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_739, float2(0.0), isnan(_739)), level(_122)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float _318 = 0.0 + _120;
        float _320 = precise::clamp(_318, 0.0, 1.0);
        float _322 = -_296;
        float _324 = _288 + _322;
        float _326 = -_298;
        float _328 = _290 + _326;
        float _330 = -_300;
        float _332 = _292 + _330;
        float _334 = fma(_242, _324, _296);
        float _336 = fma(_242, _328, _298);
        float _338 = fma(_242, _332, _300);
        float _340 = -_312;
        float _342 = _304 + _340;
        float _344 = -_314;
        float _346 = _306 + _344;
        float _348 = -_316;
        float _350 = _308 + _348;
        float _352 = fma(_242, _342, _312);
        float _354 = fma(_242, _346, _314);
        float _356 = fma(_242, _350, _316);
        float _358 = -_352;
        float _360 = _358 + _334;
        float _362 = -_354;
        float _364 = _362 + _336;
        float _366 = -_356;
        float _368 = _366 + _338;
        float _370 = fma(_248, _360, _352);
        float _372 = fma(_248, _364, _354);
        float _374 = fma(_248, _368, _356);
        out.m_40.x = _370;
        out.m_40.y = _372;
        out.m_40.z = _374;
        out.m_40.w = _320;
        return out;
    }
    discard_fragment();
    return out;
}

